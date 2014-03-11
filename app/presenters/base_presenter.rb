class BasePresenter
  attr_accessor :object, :action_name

  # Examples:
  #   class UserPresenter < BasePresenter
  #     attr_accessor :current_user
  #   end
  #
  #   UserPresenter.new(@user)
  #   UserPresenter.new(@user, :current_user => current_user)
  #
  def initialize(*args)
    attrs = args.last.is_a?(Hash) ? args.pop : {}
    self.object = args.first
    attrs.each do |attr, value|
      send("#{attr}=", value)
    end
  end

  # Common helper methods
  def routes
    Rails.application.routes.url_helpers
  end

  def show_url
    routes.send("#{resource_name}_path", object)
  end

  def edit_url
    routes.send("edit_#{resource_name}_path", object)
  end

  def index_url
    routes.send("#{resource_name.pluralize}_path")
  end

  private
  def resource_name
    object.class.name.underscore
  end
end
