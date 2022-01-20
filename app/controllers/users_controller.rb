class UsersController < ApplicationController
    before_action :authenticate!, except: [:new, :create]
end
