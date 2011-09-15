class ChatController < ApplicationController
  before_filter :authenticate_usuario!

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
    respuesta = { :mensaje => msj, :usuario => current_usuario.email }
    avatares = current_usuario.amigo.avatars.map(&:nombre)
    avatares.each do |avatar|
      if msg.include? avatar
        ava = current_usuario.amigo.avatars.find_by_nombre avatar
        respuesta.update( { :avatar => ava.avatar.url } )
        break
      end
    end
    return respuesta
  end

  def select_channel(receiver)
    puts "#{receiver}"
    return "/chats#{receiver}"
  end

end
