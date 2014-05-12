class HomeController < ApplicationController
  def index
    @recommended_list = List.first
  end
end
