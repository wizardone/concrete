require 'concrete/version'
require 'byebug'

module Concrete

  def self.extended(base)
    if [Module, Object].include?(base.superclass)
      base.extend(MainClassMethods)
    else
      base.extend(InheritedClassMethods)
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
          define_singleton_method("#{prop}=") do |val|
            instance_variable_set("@#{prop}", val)
          end

          define_singleton_method("#{prop}") do
            instance_variable_get("@#{prop}")
          end
        end
      end
    end
  end

  module InheritedClassMethods
    def concrete_for(method)
      parent = self.superclass
      if parent.concrete.include?(method)
        parent.public_send(method)
      end
    end
  end
end
