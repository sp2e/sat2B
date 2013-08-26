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
        #request.user_agent =~  /Mobile|webOS/ 
        my_user_agent = request.user_agent
        (my_user_agent =~ /Mobile|webOS/ ) && (my_user_agent !~ /iPad/  )
        #aaa = (my_user_agent =~ /Mobile|webOS/ )
        #bbb = (my_user_agent !~ /iPad/  )
        #aaa && bbb
      end
    end
    helper_method :mobile_device?

    def prepare_for_mobile
      #for switching between layout formats, not implemented yet
      session[:mobile_param] = params[:mobile] if params[:mobile]
      #request.format = :mobile if mobile_device?
      if mobile_device?
        request.format = :mobile
      else
        request.format = :html
      end
    end

end
