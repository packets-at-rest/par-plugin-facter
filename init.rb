$:.unshift File.expand_path(".", __FILE__)

require_relative './lib/plugin'
require_relative './lib/version'
# PacketsAtRest.logger.info 'Starting Example plugin for PacketsAtRest'

PacketsAtRest::Plugin.register :par_plugin_facter do
  name 'Facter plugin for Packets At REST'
  author 'shadowbq'
  description 'returns json output of the facter gem for system information'

  url 'http://github.com/packets-at-rest/par_plugin_facter'
  author_url 'mailto:shadowbq@gmail.com'

  requires_packetsatrest :version_or_higher => '0.6.0'
  version '0.0.1'

  version PacketsAtRest::ParPluginFacter::VERSION

end
