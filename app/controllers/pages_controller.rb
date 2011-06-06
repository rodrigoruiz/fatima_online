class PagesController < ApplicationController
  def home
    @title = "Home"
  end
  
  def procedimentos
    @title = "Procedimentos"
  end
  
  def consultorios
    @title = "Consultorios"
  end
  
  def convenios
    @title = "Convenios"
  end
  
  def dra_fatima
    @title = "Dra. Maria de Fatima Maklouf Amorim Ruiz"
  end
  
  def contato
    @title = "Contato"
  end
end
