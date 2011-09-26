class ChatController < ApplicationController
  before_filter :authenticate_usuario!

  def send_message
    @messg = params[:msg_body]
    @sender = params[:sender]
    respuesta = parse_chat_message(params[:msg_body])
    Juggernaut.publish("/chats/canal1", respuesta)
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

  def email
    respond_to do |format|
      format.html { render :layout => false, :partial => 'email' } 
      format.js
    end
  end

  def enviar_email
    if params[:asunto] and params[:email] and params[:mensaje]
      # SolicitudMailer.delay.contacto(params[:email], params[:nombre], params[:mensaje], params[:telefono]) 
      puts '*****Enviando email******'
    else
      msg_error = "Los campos email, asunto y mensaje son obligatorios."
    end

    respond_to do |format|
      if msg_error 
        flash[:alert] = msg_error
      else
        flash[:notice] = "Su correo ha sido enviado correctamente."
      end
      format.html { redirect_to(:action => :email) }
    end
  end

  def avatar
    respond_to do |format|
      format.html { render :layout => false, :partial => 'avatar'}
      format.js
    end
  end

  def enviar_avatar
    if params[:asunto] and params[:email] and params[:mensaje] and params[:avatar]
      # SolicitudMailer.delay.contacto(params[:email], params[:nombre], params[:mensaje], params[:telefono]) 
      puts '*****Enviando email******'
    else
      msg_error = "Los campos email, asunto, avatar y mensaje son obligatorios."
    end

    respond_to do |format|
      if msg_error 
        flash[:alert] = msg_error
      else
        flash[:notice] = "Su avatar ha sido enviado por correo correctamente."
      end
      format.html { redirect_to(:action => :avatar) }
    end
  end
end
