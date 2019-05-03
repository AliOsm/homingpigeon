class PigeonMessagesController < ApplicationController
  def pigeon_message
    permitted = params.permit(:token, :information)

    information = permitted[:information]
    token = permitted[:token]

    if information.blank?
      render json: { status: :invalid_pigeon_information }, status: :bad_request
    else
      pigeon = Pigeon.where(token: token).first

      if pigeon.blank?
        render json: { status: :invalid_pigeon_token }, status: :bad_request
      else
        pigeon.pigeon_messages.create(information: information, user: pigeon.user)
        if pigeon.pigeon_messages_count > 100
          pigeon.pigeon_messages.order(created_at: :desc).last.destroy
        end
        render json: { status: :pigeon_message_created }, status: :created
      end
    end
  end
end
