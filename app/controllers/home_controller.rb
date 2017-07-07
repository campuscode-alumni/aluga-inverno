class HomeController < ApplicationController
  def index
     @properties = Property.all
     if @properties.empty?
       flash[:notice] = "Nenhum propriedade disponivel"
     end
  end
end
