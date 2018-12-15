class HomeController < ApplicationController
  def index
    @startup_nb = Startup.count
    @people_nb = User.count
  end

end
