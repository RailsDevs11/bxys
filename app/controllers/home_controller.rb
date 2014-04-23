class HomeController < ApplicationController

  def index
    @quizes = Quize.publish.order("created_at DESC")
  end
  
end
