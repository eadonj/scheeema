require 'spec_helper'

describe Apprenticeship do
  it { should belong_to :student }
  it { should belong_to :master }
end
