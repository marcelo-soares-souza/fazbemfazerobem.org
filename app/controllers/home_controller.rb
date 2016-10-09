class HomeController < ApplicationController
  def index
    @projetos = Projeto.all
  end

  def sobre
  end
end
