module CartSessionsHelper
    def first_cart_session
        current_user.cart_sessions.first
    end

    def current_cart_session
        current_user.cart_sessions.last
    end

    def count_cart_sessions
        current_user.cart_sessions.count
    end
end
