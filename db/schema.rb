# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110919160436) do

  create_table "amigos", :force => true do |t|
    t.integer  "skin_id"
    t.integer  "usuario_id"
    t.boolean  "activo"
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "amigos", ["skin_id"], :name => "index_amigos_on_skin_id"
  add_index "amigos", ["usuario_id"], :name => "index_amigos_on_usuario_id"

  create_table "amistads", :force => true do |t|
    t.integer  "amigo_id"
    t.integer  "amigo_destino_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "amistads", ["amigo_destino_id"], :name => "index_amistads_on_amigo_destino_id"
  add_index "amistads", ["amigo_id"], :name => "index_amistads_on_amigo_id"

  create_table "avatars", :force => true do |t|
    t.integer  "amigo_id"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
  end

  add_index "avatars", ["amigo_id"], :name => "index_avatars_on_amigo_id"

  create_table "emails", :force => true do |t|
    t.integer  "amistad_id"
    t.string   "asunto"
    t.text     "contenido"
    t.date     "fecha"
    t.time     "hora"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emails", ["amistad_id"], :name => "index_emails_on_amistad_id"

  create_table "historials", :force => true do |t|
    t.integer  "amigo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "platica_file_name"
    t.string   "platica_content_type"
    t.integer  "platica_file_size"
    t.datetime "platica_updated_at"
  end

  add_index "historials", ["amigo_id"], :name => "index_historials_on_amigo_id"

  create_table "skins", :force => true do |t|
    t.string   "margen"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cabecera_file_name"
    t.string   "cabecera_content_type"
    t.integer  "cabecera_file_size"
    t.datetime "cabecera_updated_at"
    t.string   "fondo_file_name"
    t.string   "fondo_content_type"
    t.integer  "fondo_file_size"
    t.datetime "fondo_updated_at"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
