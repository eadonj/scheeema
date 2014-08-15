module Scheeema
  class Table
    attr_reader :name
    private_class_method :new

    def self.all
      names = connection.tables - ['schema_migrations']
      names.map { |table_name| new(table_name) }
    end

    def initialize(name)
      @name = name
    end

    def columns
      connection.columns(name).map { |ar_column| Column.new(ar_column) }
    end

    private

    def connection
      ActiveRecord::Base.connection
    end

    def self.connection
      ActiveRecord::Base.connection
    end
  end

  class Column
    extend Forwardable

    def initialize(ar_column)
      @ar_column = ar_column
    end

    def_delegators :@ar_column, :name, :type
  end
end
