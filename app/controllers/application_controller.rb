# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    flash[:alert] = 'Unable to find the records.'
    redirect_to(request.referer || root_path)
  end
end
