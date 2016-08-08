class ApplicationController < ActionController::Base

  private
  def show_error(resource, status)
    render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerialize
  end
end
