class HomeController < ApplicationController
  def index
    @cats = Cat.limit(2).order("RANDOM()")
    @ip   = request.remote_ip
    @vote = Vote.new
  end
end
