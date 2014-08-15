module Scheeema
  class TablesController < ActionController::Base
    def index
      @tables = ActiveRecord::Base.connection.tables
      render :index
    end
  end
end
