class HomeController < ApplicationController
  def index
    @projetos = Projeto.all
    @tipos = Tipo.all
  end

  def sobre
  end
end
