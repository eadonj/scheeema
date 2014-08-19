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
      model.reflect_on_all_associations.map { |ar_association| Association.new(ar_association, self) }
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
    def initialize(ar_association, table)
      @ar_association = ar_association
      @table = table
    end

    delegate :name, :foreign_key, to: :ar_association

    def type
      if through_table
        "#{ar_association.macro}_through".to_sym
      else
        ar_association.macro
      end
    end

    def remote_table
      # if there's a table called firsttable_secondtable, rails will return that table here,
      # regardless of whether it is used for this association. Only has_and_belongs_to_many assocations
      # have join tables, so just forcing it here.
      if type == :has_and_belongs_to_many
        ar_association.join_table
      elsif through_table
        through_table
      else
        ar_association.table_name
      end
    end

    def remote_key
      ar_association.belongs_to? ? primary_key : foreign_key
    end

    def local_table
      table
    end

    def through_table
      ar_association.options[:through].to_s.pluralize if ar_association.options[:through]
    end

    def local_key
      ar_association.belongs_to? ? foreign_key : primary_key
    end

    private

    def foreign_key
      ar_association.foreign_key
    end

    def primary_key
      ar_association.active_record_primary_key
    end

    attr_reader :ar_association
  end
end
