require 'shadow_puppet'

class Sliceconfig::Stack < ShadowPuppet::Manifest
  class_attribute :availible_stacks
  self.availible_stacks = []

  class << self
    def install(stack)
      raise ArgumentError.new, "Invalid stack. Registered: #{availible_stacks.join(', ')}" unless availible_stacks.include?(stack)
      "Sliceconfig::Stack::#{stack.to_s.classify}".constantize.new.execute
    end

    def register_stack(stack)
      self.availible_stacks << stack.to_sym
    end
  end
end

require 'sliceconfig/stack/base'