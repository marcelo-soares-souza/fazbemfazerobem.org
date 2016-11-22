class HomeController < ApplicationController
  def index
    @entidades = Entidade.all
    @projetos = Projeto.all
    @tipos = Tipo.all
  end

  def sobre
  end

  def porque
  end

  def como
  end

  def doadores
  end

  def parceiros
  end
end
