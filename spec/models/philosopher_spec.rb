require 'spec_helper'

describe Philosopher do
  it { should have_and_belong_to_many :paradigms }
  it { should have_many :exemplar_paradigms }
end
