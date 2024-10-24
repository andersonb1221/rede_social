class MessagesController < ApplicationController

  def index
    @users = User.all.order(nome: :asc)
  end

  def show
    @recipient = User.find(params[:id])
    @messages = Message.where(sender_id: current_user.id, recipient_id: @recipient.id)
                      .or(Message.where(sender_id: @recipient.id, recipient_id: current_user.id))
                      .order(created_at: :asc)
  end

  def send_message
    recipient = User.find(params[:recipient_id])
    mensagem = Message.new(sender_id: current_user.id, recipient_id: recipient.id, content: params[:mensagem])
    redirect_to message_path(recipient) if mensagem.save
  end

end
