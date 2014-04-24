class HomeController < ApplicationController

  def index
    @quizes = Quize.publish.order("created_at DESC")
  end

  def score_up
    render :text => 'thanks'
  end
    
end
