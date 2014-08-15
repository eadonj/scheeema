require 'spec_helper'

describe Paradigm do
  it { should have_and_belong_to_many :philosophers }
  it { should have_many :mentions }
  it { should belong_to :exemplar }
end
