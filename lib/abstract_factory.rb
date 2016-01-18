# This class returns a module that when included defines the
# concrete_factories method on its class which in turn returns
# an array of classes belonging to the argument module.

# Usage:
#
# class Foo
#   include AbstractFactory.new(FactoryWrapperModule)
#
#   concrete_factories.each do |factory|
#     ...
#   end
# end

class AbstractFactory < Module

  def initialize(mod)
    @mod = mod
    define_methods
  end

  private

  def define_methods
    define_concrete_factories_method
  end

  def define_concrete_factories_method
    mod = @mod
    define_method(:concrete_factories) do
      mod.constants.reduce([]) do |classes, constant|
        const = mod.const_get(constant)
        if const.is_a? Class
          classes.push(const)
        end

        classes
      end
    end
  end

end