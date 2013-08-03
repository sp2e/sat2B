class ApplicationController < ActionController::Base
    #the following line , from Railscast #199, not needed nor used for Rails 3.1 +
    #helper :all

    protect_from_forgery

    #all of the following from Railscast #199
    before_filter :prepare_for_mobile  #from Railscast #199

    private
     def mobile_device?
      if session[:mobile_param]
        session[:mobile_param] == "1"
      else
        request.user_agent =~ /Mobile|webOS/
      end
    end
    helper_method :mobile_device?

    def prepare_for_mobile
      #for switching between layout formats, not implemented yet
      #session[:mobile_param] = params[:mobile] if params[:mobile]
      request.format = :mobile if mobile_device?
    end

end
