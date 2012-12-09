class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include UsersHelper

  def clone_with_errors(object)
    clone = object.clone
    object.errors.each{|field, msg| clone.errors.add :base, msg }
    return clone
  end

end
