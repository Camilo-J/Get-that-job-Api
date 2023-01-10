# frozen_string_literal: true

module Api
  module V1
    module OverridesUser
      # RegistrationsController api
      class RegistrationsController < ::DeviseTokenAuth::RegistrationsController
        before_action :configure_permitted_parameters
        skip_before_action :authenticate_api_v1_user!
        skip_before_action :authenticate_api_v1_company!
        # override this method to customise how the resource is rendered. in this case an ActiveModelSerializers 0.10 serializer.
        def render_create_success
          render json: { data: ActiveModelSerializers::SerializableResource.new(@resource).as_json }
        end

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up,
                                            keys: %i[phone name birthdate linkedin title email experience education
                                                     curriculum])
          devise_parameter_sanitizer.permit(:account_update,
                                            keys: %i[phone name birthdate linkedin title email experience education
                                                     curriculum])
        end
      end
    end
  end
end
