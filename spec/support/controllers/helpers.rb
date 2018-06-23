module Controllers
  module Helpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end

    def login(user)
      @user = user

      @auth_headers = @user.create_new_auth_token
      @token = @auth_headers['access-token']
      @client_id = @auth_headers['client']
      @expiry = @auth_headers['expiry']

      age_token(@user,@client_id)
      request.headers.merge!(@auth_headers)
    end

    private

    def age_token(user, client_id)
      user.tokens[client_id]['updated_at'] = Time.now - (DeviseTokenAuth.batch_request_buffer_throttle + 10.seconds)
      user.save
    end
  end
end
