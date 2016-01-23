class ManageUsersController < ApplicationController

    def index
      @allUsers = User.all
    end

     
end
