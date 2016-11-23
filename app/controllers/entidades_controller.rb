class EntidadesController < ApplicationController
  before_action :set_entidade, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :load_tipos
  before_action :load_uf
  before_action only: [:edit, :update, :destroy] { check_owner Entidade.friendly.find(params[:id]).user_id }

  # GET /entidades
  # GET /entidades.json
  def index
    if params[:tipo_id]
      @entidades = Tipo.friendly.find(params[:tipo_id]).entidades
    else
      @entidades = Entidade.all
    end
  end

  # GET /entidades/1
  # GET /entidades/1.json
  def show
  end

  # GET /entidades/new
  def new
    @entidade = Entidade.new
  end

  # GET /entidades/1/edit
  def edit
  end

  # POST /entidades
  # POST /entidades.json
  def create
    @entidade = Entidade.new(entidade_params)
    @entidade.user_id = current_user.id

    respond_to do |format|
      if @entidade.save
        format.html { redirect_to @entidade, notice: 'Entidade foi adicionado(a) com sucesso.' }
        format.json { render :show, status: :created, location: @entidade }
      else
        format.html { render :new }
        format.json { render json: @entidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entidades/1
  # PATCH/PUT /entidades/1.json
  def update
    respond_to do |format|
      if @entidade.update(entidade_params)
        format.html { redirect_to @entidade, notice: 'Entidade foi alterado(a) com sucesso.' }
        format.json { render :show, status: :ok, location: @entidade }
      else
        format.html { render :edit }
        format.json { render json: @entidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entidades/1
  # DELETE /entidades/1.json
  def destroy
    @entidade.destroy
    respond_to do |format|
      format.html { redirect_to entidades_url, notice: 'Entidade foi removido(a) com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entidade
      @entidade = Entidade.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entidade_params
      params.require(:entidade).permit(:nome, :cnpj, :descricao, :tipo_id, :logradouro, :cidade, :estado, :cep, :latitude, :longitude)
    end

    def load_tipos
      @tipos = Tipo.all
    end

    def load_uf 
      @ufs = { "Acre" => "AC", "Alagoas" => "AL", "Amapá" => "AP", "Amazonas" => "AM", "Bahia" => "BA", "Ceará" => "CE", "Distrito Federal" => "DF", "Espírito Santo" => "ES", "Goiás" => "GO", "Maranhão" => "MA", "Mato Grosso" => "MT", "Mato Grosso do Sul" => "MS", "Minas Gerais" => "MG", "Pará" => "PA", "Paraíba" => "PB", "Paraná" => "PR", "Pernambuco" => "PE", "Piauí" => "PI", "Rio de Janeiro" => "RJ", "Rio Grande do Norte" => "RN", "Rio Grande do Sul" => "RS", "Rondônia" => "RO", "Roraima" => "RR", "Santa Catarina" => "SC", "São Paulo" => "SP", "Sergipe" => "SE", "Tocantins" => "TO" }
    end
end
