module Users
  class SessionsController < ApplicationController
    def index
    end

    def new
      redirect_to root_url
    end

    def destroy
      sign_out
      redirect_to root_url
    end
  end
end
