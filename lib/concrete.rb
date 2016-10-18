require 'concrete/version'
require 'byebug'

module Concrete

  def concrete_attribute(*attr)
    attr.each do |prop|
      instance_eval %Q{
        def #{prop}=(v)
          @#{prop} = v
        end

        def #{prop}
          return @#{prop} if instance_variable_defined?(:@#{prop})
          @#{prop} = concrete_for(self, :#{prop})
        end
      }
    end
  end

  def concrete_for(klass, method)
    parent = klass.superclass
    return unless parent.respond_to?(method)

    parent.public_send(method)
  end
end
