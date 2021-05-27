class InvitesController < ApplicationController
  def create
    invite = Invite.new
    invite.event_id = params[:event_id]
    invite.invitee_id = params[:invitee_id]

    invite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Invite.where(event_id: params[:event_id], invitee_id: params[:invitee_id]).destroy_all

    redirect_back(fallback_location: root_path)
  end
end
