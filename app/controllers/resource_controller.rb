class ResourceController < ApplicationController
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_resources, :only => :index

  private
  def load_resource
    klass = resource_klass
    if klass
      # Find the record and assign it to an instance variable
      # E.g. in UsersController +@user+ will be assinged a the User record which matches the given id.
      instance_variable_set("@#{controller_name.singularize}", klass.find(params[:id]))
    end
  end

  def load_resources
    klass = resource_klass
    if klass
      instance_variable_set("@#{controller_name}", klass.all)
    end
  end

  def resource_klass
    controller_name.classify.safe_constantize
  end
end
