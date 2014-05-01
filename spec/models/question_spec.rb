require 'spec_helper'

describe Question do
  it { should validate_presence_of :title }
  it { should belong_to :user }
end
