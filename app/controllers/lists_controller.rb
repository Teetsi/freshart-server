class ListsController < ApplicationController
  respond_to :html, :xml, :json

  def recommended
    @recommended_list = List.first

    respond_with @recommended_list.exhibitions
  end
end
