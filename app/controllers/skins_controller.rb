class SkinsController < ApplicationController
  def get
    @skin = Skin.find(params[:id])
    respuesta = { :cabecera => @skin.cabecera.url, :fondo => @skin.fondo.url, :margen => @skin.margen }
    respond_to do |format|
      format.js { render :json => respuesta }
    end
  end

end
