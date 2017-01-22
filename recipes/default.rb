#
# Cookbook:: tyw_hashicorp_vault
# Recipe:: default
#
# Copyright:: 2017, Tyler Wong All Rights Reserved.

include_recipe 'hashicorp-vault::default'

magic_shell_environment 'PATH' do
  value "$PATH:/opt/vault/#{node['hashicorp-vault']['version']}/"
  action :add
end

edit_resource!(:vault_config, node['hashicorp-vault']['config']['path']) do
  backend_type 'consul'
  backend_options 'address' => 'consul.service.consul:8500',
                  'path' => 'vault/'
end
