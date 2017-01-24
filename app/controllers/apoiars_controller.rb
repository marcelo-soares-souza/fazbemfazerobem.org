class ApoiarsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :set_apoiar, only: [:show, :edit, :update, :destroy]
  before_action :load_pedidos
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] { check_owner Apoiar.friendly.find(params[:id]).user_id }

  # GET /apoiars
  # GET /apoiars.json
  def index
    @apoiars = Apoiar.all
  end

  # GET /apoiars/1
  # GET /apoiars/1.json
  def show
  end

  # GET /apoiars/new
  def new
    @apoiar = Apoiar.new

    if params[:projeto_id]
      @pedidos = Projeto.friendly.find(params[:projeto_id]).pedidos
    else
      @pedidos = Pedido.all
    end
  end

  # GET /apoiars/1/edit
  def edit
  end

  # POST /apoiars
  # POST /apoiars.json
  def create
    @apoiar = Apoiar.new(apoiar_params)
    @apoiar.user_id = current_user.id

    respond_to do |format|
      if @apoiar.save
        format.html { redirect_to @apoiar, notice: 'Apoiar was successfully created.' }
        format.json { render :show, status: :created, location: @apoiar }
      else
        format.html { render :new }
        format.json { render json: @apoiar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apoiars/1
  # PATCH/PUT /apoiars/1.json
  def update
    respond_to do |format|
      if @apoiar.update(apoiar_params)
        format.html { redirect_to @apoiar, notice: 'Apoiar was successfully updated.' }
        format.json { render :show, status: :ok, location: @apoiar }
      else
        format.html { render :edit }
        format.json { render json: @apoiar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apoiars/1
  # DELETE /apoiars/1.json
  def destroy
    @apoiar.destroy
    respond_to do |format|
      format.html { redirect_to apoiars_url, notice: 'Apoiar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apoiar
      @apoiar = Apoiar.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apoiar_params
      params.require(:apoiar).permit(:user_id, :pedido_id, :slug)
    end

    def load_pedidos
      @pedidos = Pedido.all
    end
end
