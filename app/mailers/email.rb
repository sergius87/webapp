class Email < ApplicationMailer
	default from: "sergiosaezdeibarra@hotmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email.recepcion.subject
  #
 def micorreo(parametros)
 	@name = parametros[:name]
 	@email = parametros[:email]
 	@message = parametros[:message]

 	mail :to => "sergiosaezdeibarra@hotmail.com", 
 		:subject => "Un nuevo mensaje de la app" 
 end

 def enviar(parametros)
 	@name = parametros[:name]
 	@email = parametros[:email]
 	@message = parametros[:message]

 	mail :to => parametros[:email], :subject => "Tu mensaje se ha enviado correctamente"
 end
end
