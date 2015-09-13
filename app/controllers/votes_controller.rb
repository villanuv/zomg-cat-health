class VotesController < ApplicationController
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
  end

  def create
  end

  def destroy
  end
end
