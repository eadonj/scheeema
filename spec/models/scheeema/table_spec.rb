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

    it 'includes the last name column' do
      expect(last_name_column).to be_present
    end

    it 'includes the column name' do
      expect(last_name_column.name).to eq('last_name')
    end

    it 'includes the column type' do
      expect(last_name_column.type).to eq(:string)
    end
  end

  describe '#associations' do
    it 'returns an array' do
      expect(philosophers_table.associations).to be_a(Array)
    end

    context 'has_and_belongs_to_many' do
      let(:paradigms_association) { philosophers_table.associations.detect { |assoc| assoc.name == :paradigms } }

      it 'includes the paradigms association' do
        expect(paradigms_association).to be_present
      end

      it 'includes the association type' do
        expect(paradigms_association.type).to eq(:has_and_belongs_to_many)
      end

      it 'includes the name' do
        expect(paradigms_association.name).to eq(:paradigms)
      end

      it 'includes the foreign table' do
        expect(paradigms_association.foreign_table).to eq('paradigms_philosophers')
      end

      it 'includes the foreign_key' do
        expect(paradigms_association.foreign_key).to eq('philosopher_id')
      end

      it 'includes the primary_key' do
        expect(paradigms_association.primary_key).to eq('id')
      end
    end

    context 'has_many' do
      let(:exemplar_association) { philosophers_table.associations.detect { |assoc| assoc.name == :exemplar_paradigms } }

      it 'includes the paradigms association' do
        expect(exemplar_association).to be_present
      end

      it 'includes the association type' do
        expect(exemplar_association.type).to eq(:has_many)
      end

      it 'includes the name' do
        expect(exemplar_association.name).to eq(:exemplar_paradigms)
      end

      it 'includes the foreign table' do
        expect(exemplar_association.foreign_table).to eq('paradigms')
      end

      it 'includes the foreign_key' do
        expect(exemplar_association.foreign_key).to eq('exemplar_id')
      end

      it 'includes the primary_key' do
        expect(exemplar_association.primary_key).to eq('id')
      end
    end
  end
end
