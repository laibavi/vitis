class Admin::AdminController < ActionController::Base
    layout "admin/layouts/application"
    include SessionsHelper

    before_action :require_login

   def require_login
       unless logged_in? && check_admin?
           redirect_to login_path
       end
   end
end
