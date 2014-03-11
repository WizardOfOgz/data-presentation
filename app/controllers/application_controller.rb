class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]

  private
  def load_resource
    klass = controller_name.classify.safe_constantize

    if klass
      # Find the record and assign it to an instance variable
      # E.g. in UsersController +@user+ will be assinged a the User record which matches the given id.
      resource = instance_variable_set("@#{controller_name.singularize}", klass.find(params[:id]))
    end
  end
end
