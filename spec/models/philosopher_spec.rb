require 'spec_helper'

describe Philosopher do
  it { should have_and_belong_to_many :paradigms }
  it { should have_many :exemplar_paradigms }

  it { should have_many(:students).through(:apprenticeships) }
  it { should have_many :apprenticeships }
  it { should have_one(:feathered_quill).through(:esoteric_tool_set) }
  it { should have_one :esoteric_tool_set }
end
