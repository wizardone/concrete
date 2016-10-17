require "concrete/version"
require 'byebug'

module Concrete

  def self.included(base)
    if [Module, Object].include?(base.superclass)
      base.extend(MainClassMethods)
    else

    end
  end

  module MainClassMethods
    def concrete
      @concrete ||= []
    end

    def concrete=(attr)
      @concrete = attr
    end

    def concrete_attributes(*attr)
      self.concrete = attr

      instance_eval do
        self.concrete.each do |prop|
          define_method("#{prop}=") do |val|
            instance_variable_set("@#{prop}", val)
          end

          define_method("#{prop}") do
            instance_variable_get("@#{prop}")
          end
        end
      end
    end
  end
end
