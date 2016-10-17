require "concrete/version"

module Concrete
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def concrete
      @concrete ||= []
    end

    def concrete_attributes(*attr)
      concrete = attr
    end
  end
end
