# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: {
      data: ActiveModelSerializers::SerializableResource.new(users, each_serializer: Api::V1::Users::UserSerializer),
      message: ['User list fetched successfully'],
      status: 200,
      type: 'Success'
    }
  end
end
