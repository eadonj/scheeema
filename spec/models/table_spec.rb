require 'spec_helper'

describe Table do
  describe '.all' do
    it 'returns an array' do
      expect(Table.all).to be_a(Array)
    end

    it 'returns table objects' do
      expect(Table.all.first).to be_a(Table)
    end

    it 'includes our example table' do
      philosophers = Table.all.detect { |table| table.name == 'philosophers' }
      expect(philosophers).to be_present
    end
  end
end
