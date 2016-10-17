require 'spec_helper'
require 'byebug'
SomeClass = Class.new do
  include Concrete
end

describe Concrete do

  subject { SomeClass }

  it 'has a version number' do
    expect(Concrete::VERSION).not_to be nil
  end

  it 'has an empty array of concrete definitions by default' do
    expect(subject.concrete).to eq([])
  end
 end
