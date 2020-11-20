module SessionsHelper
    def current_user
        User.find_by(email: session[:user9527])
    end
end