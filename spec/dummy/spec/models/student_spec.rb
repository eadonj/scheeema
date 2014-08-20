require 'spec_helper'

describe Student do
  it { should have_many :apprenticeships }
  it { should have_many(:masters).through(:apprenticeships) }
end
