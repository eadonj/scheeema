require 'spec_helper'

describe FeatheredQuill do
  it { should have_one :esoteric_tool_set }
  it { should have_one(:philosopher).through(:esoteric_tool_set) }
end
