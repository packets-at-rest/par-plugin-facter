require_relative './plugin_base'

module PacketsAtRest
    module ParPluginFacter
        class Plugin < PluginBase

            get '/facter' do
                if PacketsAtRest::ROLE == :collector
                   env['warden'].authenticate!(:node_access_token)
                end

                content_type :json
                begin
                    return `facter -j`
                rescue
                    return internalerror 'there was a problem running facter'
                end
            end

            if PacketsAtRest::ROLE == :collector
                get '/nodes/:node_id/facter', allows: [:api_key, :node_id, :command] do

                  param :api_key,             String, format: /^[a-zA-Z0-9\-]+$/, required: true
                  param :node_id,             Integer, transform: :to_s, required: true

                  content_type :json

                  env['warden'].authenticate!(:node_access_token)
                  return forbidden 'api_key not allowed to request this resource' unless @collector.authorized_nodes(params['api_key']).include?(params['node_id'])
                  return badrequest 'unknown node' unless @collector.valid_node? params['node_id']

                  begin
                    node_address = @collector.lookup_nodeaddress_by_id(params['node_id'])

                    uri = URI.encode("http://#{node_address}/facter")
                    RestClient.get(uri) do |response, request, result|
                      [response.code, response.body]
                    end
                  rescue
                    return internalerror 'there was a problem requesting from the node'
                  end
                end
            end    

        end
    end
end
