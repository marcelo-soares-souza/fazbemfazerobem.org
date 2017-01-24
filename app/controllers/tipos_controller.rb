class TiposController < ApplicationController
  protect_from_forgery with: :exception
  before_action :set_tipo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :check_if_admin

  # GET /tipos
  # GET /tipos.json
  def index
    @tipos = Tipo.all
  end

  # GET /tipos/1
  # GET /tipos/1.json
  def show
  end

  # GET /tipos/new
  def new
    @tipo = Tipo.new
  end

  # GET /tipos/1/edit
  def edit
  end

  # POST /tipos
  # POST /tipos.json
  def create
    @tipo = Tipo.new(tipo_params)
    @tipo.user_id = current_user.id

    respond_to do |format|
      if @tipo.save
        format.html { redirect_to @tipo, notice: 'Tipo foi adicionado(a) com sucesso.' }
        format.json { render :show, status: :created, location: @tipo }
      else
        format.html { render :new }
        format.json { render json: @tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipos/1
  # PATCH/PUT /tipos/1.json
  def update
    respond_to do |format|
      if @tipo.update(tipo_params)
        format.html { redirect_to @tipo, notice: 'Tipo foi alterado(a) com sucesso.' }
        format.json { render :show, status: :ok, location: @tipo }
      else
        format.html { render :edit }
        format.json { render json: @tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos/1
  # DELETE /tipos/1.json
  def destroy
    @tipo.destroy
    respond_to do |format|
      format.html { redirect_to tipos_url, notice: 'Tipo foi removido(a) com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo
      @tipo = Tipo.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_params
      params.require(:tipo).permit(:nome, :descricao, :slug, :user_id, :imagem)
    end
end
