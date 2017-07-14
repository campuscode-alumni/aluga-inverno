class ProposalsController < ApplicationController
  before_action :authenticate_owner!, only:[:index]


  def index
    @property = Property.find(params[:property_id])
    if @property.owner != current_owner
      redirect_to root_path
    end
    @proposals = @property.proposals
  end

 def accept
   @proposal = Proposal.find(params[:id])
   @proposal.accept = 1
   if @proposal.save
     redirect_to property_proposals_path
   end
 end

  def new
    @prop = Property.find(params[:property_id])
    @proposal = Proposal.new(property: @prop)
  end

  def create
    @prop = Property.find(params[:property_id])
    @proposal = @prop.proposals.new(proposal_params)
    @proposal.total_amount = calculate
    if @proposal.save
      redirect_to @proposal
    else
      flash.now[:error] = 'Você deve informar todos os dados '
      render 'new'
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  private

    def proposal_params
      params.require(:proposal).permit(:name, :email, :cpf, :phone,
        :start_date, :end_date, :total_amount, :rent_purpose, :extra_info)
    end

    def calculate
      #1o: busca um price com data inicio <= data inicio da proposta e fim >= fim da proposta
      temporada =Price.where('start_date <= ? and end_date >= ?', @proposal.start_date, @proposal.start_date).last
      if temporada.nil?
        @proposal.calculate_days * @prop.daily_rate
      else
        @proposal.calculate_days * temporada.total_amount
      end
    end


end
