require 'spec_helper'

describe EsotericToolSet do
  it { should belong_to :philosopher }
  it { should belong_to :feathered_quill }
end
