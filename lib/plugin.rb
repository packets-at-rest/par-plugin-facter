require 'sinatra/base'

module PacketsAtRest
    module ParPluginFacter
        class Plugin < Sinatra::Base
            get '/facter' do
                content_type :json
                begin
                    return `facter -j`
                rescue
                    return internalerror 'there was a problem running facter'
                end
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
