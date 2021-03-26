class ApplicationController < ActionController::Base
    
    include SessionsHelper
    
    private
    
    def require_task_logged_in
        unless logged_in?
          redirect_to login_url
        end
    end
    
    def counts(task)
      @count_tasks = user.tasks.count
    end
end
