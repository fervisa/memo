class ChatController < ApplicationController

  def send_message
    @messg = params[:msg_body]
    @sender = params[:sender]
    respuesta = parse_chat_message(params[:msg_body])
    Juggernaut.publish(select_channel("/canal1_canal2"), respuesta)
    respond_to do |format|
      format.js { render :json => respuesta }
    end
  end

  def parse_chat_message(msg)
    msj = "#{current_usuario.email} #{Time.now.strftime('%H:%M:%S')} - #{msg}"
    return { :mensaje => msj }
  end

  def select_channel(receiver)
    puts "#{receiver}"
    return "/chats#{receiver}"
  end

end
