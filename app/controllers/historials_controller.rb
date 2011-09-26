class HistorialsController < ApplicationController

  def guardar
    mensajes = params[:platica]
    ruta = File.join(Rails.root, 'tmp', "#{Time.now.to_i}_#{current_usuario.id}")
    arch = open(ruta, 'w') {|f| f.write(mensajes) } 
    platica = Historial.new
    platica.amigo = current_usuario.amigo
    platica.platica = open ruta, 'r'
    platica.save
    respond_to do |format|
      format.html
    end
  end

=begin
  def listar
    @historials = current_usuario.amigo.historials
    respond_to do |format|
      format.html { render :layout => false }
    end
  end
=end

  def detalle
    @historial = current_usuario.amigo.historials.find params[:id]
    respond_to do |format|
      format.json { render :json => {:texto => open(@historial.platica.path)}}
    end
  end
end
