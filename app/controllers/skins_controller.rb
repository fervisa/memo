class SkinsController < ApplicationController
  def get
    begin
      @skin = Skin.find(params[:id])
    rescue
      @skin = Skin.first
    end
    respuesta = { :cabecera => @skin.cabecera.url, :fondo => @skin.fondo.url, :margen => @skin.margen }
    amigo = current_usuario.amigo
    amigo.skin = @skin
    amigo.save
    respond_to do |format|
      format.js { render :json => respuesta }
    end
  end

end
