# frozen_string_literal: true

class Api::V1::Users::UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :uuid, :name, :ocupation, :email, :bio, :uuid, :avatar_url
end
