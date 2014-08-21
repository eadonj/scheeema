module Scheeema
  class TablesController < ApplicationController

    def index
      tables = Table.all
      binding.pry
      @tables = tables.map {|table| {name: table.name}}.to_json
      render :index
    end
  end
end
