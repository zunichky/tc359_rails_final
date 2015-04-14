class StaticController < ApplicationController
  def home
    before_action :only_allow_signed_in_users, except: [:index, :show]
  end
end
