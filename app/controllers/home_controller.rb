class HomeController < ApplicationController

  def index
    @quizes = Quize.all.order("created_at DESC")
  end

  def score_up
    render :text => 'thanks'
  end
    
  def vote_up
    @que = Quize.find_by_id(params[:que_id])
    @que.update_votes
  end
  
end
