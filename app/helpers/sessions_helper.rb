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

    # Returns true if the given user is the current user.
    def current_user?(user)
        user && user == current_user
    end

    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end
    # Stores the URL trying to be accessed.
    def store_location
        session[:forwarding_url] = request.original_url if request.get?
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
