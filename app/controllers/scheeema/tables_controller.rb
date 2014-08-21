module Scheeema
  class TablesController < ApplicationController

    def index
      tables = Table.all
      
      @tables = tables.map do |table| 
        association_data = table.associations.map { |assoc| { type: assoc.type, remote_table: assoc.remote_table } }
        { table_name: table.name, associations: association_data }
      end.to_json

      render :index
    end
  end
end
