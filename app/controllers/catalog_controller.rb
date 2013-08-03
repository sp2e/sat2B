class CatalogController < ApplicationController
  respond_to :html, :mobile

  def home

  	if session[:mobile_param]
  		  	request.format = :mobile
  	end

    render layout:  '/layouts/application.html'

=begin    older, but still working alternative code:
    respond_to do |format|
    	format.html
    	format.mobile {render layout: '/layouts/application.html'}
    end
=end


  end #home

  def mobile

  	request.format = :mobile #maybe not needed.
  	session[:mobile_param] = "1"
    #redirect_to '/home' 
    render template: 'catalog/home', formats: [:mobile] , layout: '/layouts/application.html'
  end #mobile

end
