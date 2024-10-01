class TicketsController < ApplicationController
  def new
    committee = Committee.find params[:committee_id]
    @ticket = committee.tickets.new(user: User.first)
  end

  def create
    committee = Committee.find params[:committee_id]
    ticket = committee.tickets.create!(params[:ticket].permit(:user_id, :title, :body))
    redirect_to ticket.committee
  end
end
