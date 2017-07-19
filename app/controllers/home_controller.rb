class HomeController < ApplicationController

  def index
     @properties = Property.all
     @purposes = Purpose.all
     if @properties.empty?
       flash[:notice] = "Nenhum propriedade disponivel"
     end
  end

  def register
  end
end
