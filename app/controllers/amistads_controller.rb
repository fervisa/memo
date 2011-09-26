class AmistadsController < ApplicationController
  def no_amigos 
    amigos_id = Amistad.where(:amigo_id => current_usuario.amigo.id).map(&:amigo_destino_id)
    amigos_id << current_usuario.amigo.id
    @amigos = Amigo.all - Amigo.where(:id => amigos_id)
    respond_to do |format|
      format.html { render :layout => false, :partial => 'no_amigos', :locals => {:amigos => @amigos} } 
      format.js
      format.xml { render :xml => @amigos }
    end
  end

  def si_amigos 
    @amistades = Amistad.where(:amigo_id => current_usuario.amigo.id)
    respond_to do |format|
      format.html { render :layout => false, :partial => 'si_amigos', :locals => {:amistades => @amistades} } 
      format.js
      format.xml { render :xml => @amistades }
    end
  end

  def create
    amigos_a_agregar = params[:amigo]
    if amigos_a_agregar
      ids = amigos_a_agregar.collect{|k, v| k}
      amigos = Amigo.find ids
      amigos.each do |amigo|
        amistad1 = Amistad.create :amigo => current_usuario.amigo, :amigo_destino => amigo
        amistad2 = Amistad.create :amigo => amigo, :amigo_destino => current_usuario.amigo
        amistad1.save
        amistad2.save
      end
    else
      error_msg = 'No ha seleccionado ningun contacto para agregar.'
    end
    if error_msg
      respond_to do |format|
        format.html { 
          flash[:alert] = error_msg 
          redirect_to(:action=>:no_amigos) } 
          format.xml  { head :not_found }
      end
    else
      respond_to do |format|
        format.html { 
          flash[:notice]  = "Los contactos fueron agregados con éxito."
          redirect_to(:action=>:no_amigos) }
          format.xml  { head :ok }
      end
    end
  end

  def delete
    amistades_a_eliminar = params[:amistad]
    if amistades_a_eliminar
      ids = amistades_a_eliminar.collect{|k, v| k}
      amistades = current_usuario.amigo.amistads.find ids
      amistades.each do |amistad|
        otra_amistad = Amistad.where :amigo_id => amistad.amigo_destino_id, :amigo_destino_id => amistad.amigo_id 
        puts otra_amistad
        otra_amistad.delete_all
        amistad.delete
      end
    else
      error_msg = 'No ha seleccionado ningun contacto para eliminar.'
    end
    if error_msg
      respond_to do |format|
        format.html { 
          flash[:alert] = error_msg 
          redirect_to(:action=>:si_amigos) } 
          format.xml  { head :not_found }
      end
    else
      respond_to do |format|
        format.html { 
          flash[:notice]  = "Los contactos fueron eliminados con éxito."
          redirect_to(:action=>:si_amigos) }
          format.xml  { head :ok }
      end
    end
  end
end
