class CommitteesController < ApplicationController
  def index
    @committees = Committee.all
  end

  def show
    @committee = Committee.find(params[:id])
  end
end
