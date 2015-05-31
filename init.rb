require 'lib/plugin'
require 'lib/version'
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
#  tags [:system_heath, :ruby_gem, :api_extension]

# Do stuff..
  run PacketsAtRest::ParPluginFacter::Plugin

end


=begin
> PacketsAtRest::Plugin.registered_plugins
=> {:par_plugin_facter=>
  #<PacketsAtRest::Plugin:0x00000003e881d8
   @author="shadowbq",
   @author_url="mailto:shadowbq@gmail.com",
   @description="returns json output of the facter gem for system information",
   @id=:par_plugin_facter,
   @name="Facter plugin for Packets At REST",
   @url="http://github.com/packets-at-rest/par_plugin_facter",
   @version="0.0.1">}
=end