class ProposalsController < ApplicationController
  before_action :authenticate_owner!, only:[:index]


  def index
    @proposals = Proposal.where(property_id: params[:property_id])
    if @proposals.last.property.owner != current_owner
      redirect_to root_path
    end
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
end
