class ProposalsController < ApplicationController
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
      flash.now[:error] = 'Você deve informar todos os dados'
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
