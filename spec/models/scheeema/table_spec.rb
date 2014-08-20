require 'spec_helper'

describe Scheeema::Table do
  let(:philosophers_table) { Scheeema::Table.all.detect { |table| table.name == 'philosophers' } }
  let(:paradigms_table) { Scheeema::Table.all.detect { |table| table.name == 'paradigms' } }

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

    it 'excludes SchemaMigration when loaded' do
      class SchemaMigration < ActiveRecord::Base; end
      expect(Scheeema::Table.all.map(&:name)).to_not include('schema_migrations')
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
      let(:association) { philosophers_table.associations.detect { |assoc| assoc.name == :paradigms } }

      it 'includes the remote table' do
        expect(association.remote_table).to eq('paradigms_philosophers')
      end

      it 'includes the remote_key' do
        expect(association.remote_key).to eq('philosopher_id')
      end

      it 'includes the local_key' do
        expect(association.local_key).to eq('id')
      end
    end

    context 'has_many' do
      let(:association) { philosophers_table.associations.detect { |assoc| assoc.name == :exemplar_paradigms } }

      it 'includes the remote table' do
        expect(association.remote_table).to eq('paradigms')
      end

      it 'includes the remote_key' do
        expect(association.remote_key).to eq('exemplar_id')
      end

      it 'includes the local_key' do
        expect(association.local_key).to eq('id')
      end
    end

    context 'belongs_to' do
      let(:association) { paradigms_table.associations.detect { |assoc| assoc.name == :exemplar } }

      it 'includes the remote table' do
        expect(association.remote_table).to eq('philosophers')
      end

      it 'includes the remote_key' do
        expect(association.remote_key).to eq('id')
      end

      it 'includes the local_key' do
        expect(association.local_key).to eq('exemplar_id')
      end
    end

    context 'has_many through' do
      let(:association) { philosophers_table.associations.detect { |assoc| assoc.name == :students } }

      it "does not return through associations" do
        expect(association).to be_nil
      end
    end

    context "has_one through" do
      let(:association) { philosophers_table.associations.detect { |assoc| assoc.name == :feathered_quill } }

      it "does not return through association" do
        expect(association).to be_nil
      end
    end

    context 'has_one' do
      let(:association) { philosophers_table.associations.detect { |assoc| assoc.name == :esoteric_tool_set } }

      it 'includes the remote table' do
        expect(association.remote_table).to eq('esoteric_tool_sets')
      end

      it 'includes the remote_key' do
        expect(association.remote_key).to eq('philosopher_id')
      end

      it 'includes the local_key' do
        expect(association.local_key).to eq('id')
      end

      it 'includes the association type' do
        expect(association.type).to eq(:has_one)
      end
    end
  end
end
