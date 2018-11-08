class HomeController < ApplicationController
  def index
    @crypto = StartScrap.new.perform
    @name = params[:name]
  end
end
