class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :destroy]

  def index
    @votes = Vote.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"cat-votes.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def new
    @vote = Vote.new
    redirect_to '/404'
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.save
    redirect_to votes_url
  end

  def destroy
    @vote.destroy
    redirect_to votes_url
  end

  private
  
  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:option, :ip_address, :cat_id)
  end

end
