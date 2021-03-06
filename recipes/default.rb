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

magic_shell_environment 'VAULT_ADDR' do
  value "http://#{node['hashicorp-vault']['config']['address']}"
  action :add
end

directory '/var/log' do
  owner 'root'
  group 'vault'
  mode 00755
  action :create
end

edit_resource!(:vault_config, node['hashicorp-vault']['config']['path']) do
  backend_type 'consul'
  backend_options 'address' => 'consul.service.consul:8500',
                  'path' => 'vault/'
end
