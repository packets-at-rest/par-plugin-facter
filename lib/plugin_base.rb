require 'warden'
require 'sinatra/base'
require 'sinatra/param'
require 'sinatra/strong-params'

module PacketsAtRest
    module ParPluginFacter
        class PluginBase < Sinatra::Base
            helpers Sinatra::Param

            register Sinatra::StrongParams

            before do
                if PacketsAtRest::ROLE == :collector
                  @collector = ::PacketsAtRest::Controllers::Collector.new
                elsif PacketsAtRest::ROLE == :node
                  @node = ::PacketsAtRest::Controllers::Node.new
                end
            end

            # Configure Warden
            use Warden::Manager do |config|
                config.scope_defaults :default,
                # Set your authorization strategy
                strategies: [:admin_access_token, :node_access_token],
                # Route to redirect to when warden.authenticate! returns a false answer.
                action: '/unauthenticated'
                config.failure_app = self
            end

            Warden::Manager.before_failure do |env,opts|
                env['REQUEST_METHOD'] = 'POST'
            end

            # This is the route that unauthorized requests gets redirected to.
            post '/unauthenticated', allows: [] do
                unauthorized "Sorry, this request can not be authenticated. Try again."
            end

            def error_message msg
              {
                "error" => msg
              }.to_json
            end

            def notfound msg
              content_type :json
              [404, error_message(msg)]
            end

            def badrequest msg
              content_type :json
              [400, error_message(msg)]
            end

            def unauthorized msg
              content_type :json
              [401, error_message(msg)]
            end

            def forbidden msg
              content_type :json
              [403, error_message(msg)]
            end

            def internalerror msg
              content_type :json
              [500, error_message(msg)]
            end
        end
    end
end
