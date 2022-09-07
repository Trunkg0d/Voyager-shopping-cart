class ApplicationController < ActionController::Base
    include SessionsHelper 
    include ProductsHelper
    include CartSessionsHelper
end
