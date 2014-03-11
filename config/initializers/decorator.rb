module Decorator
  def decorate!(decorator_name = self.class.name)
    singleton_class.class_eval do
      include("#{decorator_name}Decorator".constantize)
    end
  end
end

ActiveRecord::Base.send(:include, Decorator)
