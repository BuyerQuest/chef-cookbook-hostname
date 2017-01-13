# -*- coding: utf-8 -*-

require 'chefspec'
require 'chefspec/berkshelf'

describe 'hostnames::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new }

  it 'sets FQDN' do
    chef_run.node.override['set_fqdn'] = 'test.example.com'
    chef_run.converge described_recipe

    expect(chef_run).to render_file('/etc/hostname').with_content("test\n")
    expect(chef_run).to run_execute('hostnames test')
  end

  it "substitutes star to node's name" do
    chef_run.node.name 'test'
    chef_run.node.override['set_fqdn'] = '*.example.com'
    chef_run.converge described_recipe

    expect(chef_run).to render_file('/etc/hostname').with_content("test\n")
    expect(chef_run).to run_execute('hostnames test')
  end
end
