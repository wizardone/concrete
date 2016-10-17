require 'spec_helper'
require 'byebug'

MainClass = Class.new do
  extend Concrete
end
SubClass = Class.new(MainClass) do
  extend Concrete
end

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

    expect(subject.some_value).to be_nil
  end

  it 'inherits the concrete attributes' do
    subject.concrete_attributes(:some_value)
    sub_class = SubClass

    expect(sub_class.some_value).to eq(subject.some_value)
  end

  it 'detects parents methods' do
    subject.concrete_attributes(:some_value)
    subject.some_value = 'test'

    expect(SubClass.concrete_for(:some_value)).to eq('test')
  end
end
