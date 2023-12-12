class HomeController < ApplicationController

def index
    if current_user
        render 'profiles/index'
    end
end

end