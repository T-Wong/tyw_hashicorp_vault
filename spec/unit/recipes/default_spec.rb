#
# Cookbook:: tyw_hashicorp_vault
# Spec:: default
#
# Copyright:: 2017, Tyler Wong, All Rights Reserved.

require 'spec_helper'

describe 'tyw_hashicorp_vault::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes hashicorp-vault' do
      expect(chef_run).to include_recipe('hashicorp-vault::default')
    end

    it 'adds the required environment variables' do
      expect(chef_run).to add_magic_shell_environment('PATH')
      expect(chef_run).to add_magic_shell_environment('VAULT_ADDR')
    end
  end
end
