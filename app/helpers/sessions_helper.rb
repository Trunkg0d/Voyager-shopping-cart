module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
            @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out 
        session.delete(:user_id) 
        @current_user = nil 
    end    

    def create_shop?
        !current_shop.nil?
    end
    
    def current_shop
        @user = User.find_by(id: session[:user_id])
        @user.shop
    end
    private
        # Confirms a logged-in user.
        def logged_in_user
            unless logged_in?
                store_location
                flash[:danger] = "Please log in."
                redirect_to login_url
            end
        end
end
