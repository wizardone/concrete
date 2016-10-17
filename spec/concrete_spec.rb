require 'spec_helper'
require 'byebug'
MainClass = Class.new do
  attr_reader :readonly
  include Concrete
end
SubClass = Class.new(MainClass)

describe Concrete do

  subject { MainClass }

  it 'has a version number' do
    expect(Concrete::VERSION).not_to be nil
  end

  it 'has an empty array of concrete definitions by default' do
    expect(subject.concrete).to eq([])
  end

  it 'assigns concrete attributes to the class' do
    subject.concrete_attributes(:name, :value, :chep)

    expect(subject.concrete).not_to be_empty
    expect(subject.concrete).to match_array([:name, :value, :chep])
  end

  it 'sets the concrete attributes as methods' do
    subject.concrete_attributes(:some_value)

    expect(subject.new.some_value).to be_nil
  end

  it 'inherits the concrete attributes' do
    subject.concrete_attributes(:some_value)
    sub = SubClass.new

    expect(sub.some_value).to eq(subject.new.some_value)
  end
end
