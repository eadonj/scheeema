module Scheeema
  class Table
    attr_reader :name, :model
    private_class_method :new

    def self.all
      Dir[Rails.root.join('app', 'models', '*.rb')].each { |file| require file }
      ActiveRecord::Base.descendants.map { |model| new(model) }
    end

    def initialize(model)
      @model = model
      @name = model.table_name
    end

    def columns
      model.columns.map { |ar_column| Column.new(ar_column) }
    end

    def associations
      model.reflect_on_all_associations.map { |ar_association| Association.new(ar_association) }
    end
  end

  class Column
    extend Forwardable

    def initialize(ar_column)
      @ar_column = ar_column
    end

    def_delegators :@ar_column, :name, :type
  end

  class Association
    def initialize(ar_association)
      @ar_association = ar_association
    end

    delegate :name, :foreign_key, to: :ar_association

    def type
      ar_association.macro
    end

    def foreign_table
      # if there's a table that /looks/ like a join table (has the right name) ActiveRecord will return it here,
      # regardless of whether that association uses it. Only do this where we know we need to.
      if type == :has_and_belongs_to_many
        ar_association.join_table
      else
        ar_association.table_name
      end
    end

    def primary_key
      ar_association.active_record_primary_key
    end

    private

    attr_reader :ar_association
  end
end
