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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161015195550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entidades", force: :cascade do |t|
    t.string   "nome"
    t.string   "cnpj"
    t.text     "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "slug"
    t.integer  "tipo_id"
    t.string   "logradouro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["slug"], name: "index_entidades_on_slug", unique: true, using: :btree
    t.index ["tipo_id"], name: "index_entidades_on_tipo_id", using: :btree
    t.index ["user_id"], name: "index_entidades_on_user_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer  "projeto_id"
    t.string   "tipo"
    t.text     "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["projeto_id"], name: "index_pedidos_on_projeto_id", using: :btree
    t.index ["slug"], name: "index_pedidos_on_slug", unique: true, using: :btree
  end

  create_table "projetos", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.integer  "entidade_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.string   "slug"
    t.index ["entidade_id"], name: "index_projetos_on_entidade_id", using: :btree
    t.index ["slug"], name: "index_projetos_on_slug", unique: true, using: :btree
  end

  create_table "tipos", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.string   "slug"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.index ["user_id"], name: "index_tipos_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "nome"
    t.boolean  "admin",                  default: false
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.string   "slug"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  add_foreign_key "entidades", "tipos"
  add_foreign_key "entidades", "users"
  add_foreign_key "pedidos", "projetos"
  add_foreign_key "projetos", "entidades"
  add_foreign_key "tipos", "users"
end
