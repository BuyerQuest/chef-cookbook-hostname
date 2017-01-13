# -*- coding: utf-8 -*-

require 'chefspec'
require 'chefspec/berkshelf'

describe 'hostnames::vmware' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge described_recipe }
end
