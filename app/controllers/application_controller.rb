class ApplicationController < ActionController::Base


    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


private

def record_not_found
    render file: 'public/404.html', layout: false,
    status: 404
    # status: :not_found 兩者都可以
  end
end