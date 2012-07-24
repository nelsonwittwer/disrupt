class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def home
  	@startups = Startup.all
  end

  def suggest
  end	

end
