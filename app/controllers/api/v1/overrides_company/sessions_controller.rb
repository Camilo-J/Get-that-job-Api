# frozen_string_literal: true

module Api
  module V1
    module OverridesCompany
      # SessionsController api
      class SessionsController < ::DeviseTokenAuth::SessionsController
        skip_before_action :authenticate_api_v1_user!
        # override this method to customise how the resource is rendered. in this case an ActiveModelSerializers 0.10 serializer.
        def render_create_success
          render json: { data: ActiveModelSerializers::SerializableResource.new(@resource).as_json }
        end
      end
    end
  end
end
