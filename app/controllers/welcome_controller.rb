class WelcomeController < ApplicationController

  def index
  	@images = Dir.glob("app/assets/images/recent-recipes/*.{gif,jpg,png}")
  end

end
