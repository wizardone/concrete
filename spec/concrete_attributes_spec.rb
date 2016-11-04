require 'spec_helper'

describe ConcreteAttributes do

  subject do
    Class.new do
      extend ConcreteAttributes
      concrete_attribute :car, :truck, :plane
    end
  end

  it 'has a version number' do
    expect(ConcreteAttributes::VERSION).not_to be nil
  end

  it 'has nil value by default' do
    expect(subject.car).to be_nil
    expect(subject.truck).to be_nil
    expect(subject.plane).to be_nil
  end

  it 'inherits default class level instance methods' do
    SubClass = subclass

    expect(SubClass.car).to be_nil
    expect(SubClass.truck).to be_nil
    expect(SubClass.plane).to be_nil
  end

  it 'inherits methods with custom values' do
    subject.car = 'vw'
    SubClass = subclass

    expect(SubClass.car).to eq('vw')
  end

  it 'does not bubble the class attributes to the parent' do
    subject.car = 'mercedes'
    SubClass = subclass
    SubClass.car = 'skoda'

    expect(subject.car).to eq('mercedes')
    expect(SubClass.car).to eq('skoda')
  end

  private

  def subclass
    Class.new(subject)
  end
end
