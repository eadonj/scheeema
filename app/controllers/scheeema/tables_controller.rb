module Scheeema
  class TablesController < ApplicationController

    def index
      @tables = Table.all
      render :index
    end
    
  end
end
