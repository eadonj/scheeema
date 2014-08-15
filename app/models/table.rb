class Table
  attr_reader :name
  private_class_method :new

  def self.all
    names = connection.tables - ['schema_migrations']
    names.map { |table_name| new(table_name) }
  end

  def initialize(name)
    @name = name
    @columns = connection.columns(name)
  end

  private

  def connection
    ActiveRecord::Base.connection
  end

  def self.connection
    ActiveRecord::Base.connection
  end
end
