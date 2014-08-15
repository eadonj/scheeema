require 'spec_helper'

describe Scheeema::Table do
  let(:philosophers_table) { Scheeema::Table.all.detect { |table| table.name == 'philosophers' } }
  describe '.all' do
    it 'returns an array' do
      expect(Scheeema::Table.all).to be_a(Array)
    end

    it 'returns table objects' do
      expect(Scheeema::Table.all.first).to be_a(Scheeema::Table)
    end

    it 'includes our example table' do
      expect(philosophers_table).to be_present
    end
  end

  describe '#name' do
    it 'returns the table name' do
      expect(philosophers_table.name).to eq('philosophers')
    end
  end

  describe '#columns' do
    let(:last_name_column) { philosophers_table.columns.detect { |col| col.name == 'last_name' } }

    it 'returns an array' do
      expect(philosophers_table.columns).to be_a(Array)
    end

    it 'includes the first column on philosophers' do
      expect(last_name_column).to be_present
    end

    it 'includes the column name' do
      expect(last_name_column.name).to eq('last_name')
    end

    it 'includes the column type' do
      expect(last_name_column.type).to eq(:string)
    end
  end
end
