class HomeController < ApplicationController
  def index
  end
  def contact
    @titulo = "Contact"
  	if request.post?
  		#enviar correo
  		begin
  			if Email.micorreo(params).deliver_now and Email.enviar(params).deliver_now
  				flash[:noticia] = "Enviado correctamente"
  			end
  		rescue
  			flash[:error] = "No se ha enviado"
  		end
  	end
  end

  def about_us
  end

  def index
  end
end
