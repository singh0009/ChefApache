#
# Cookbook:: .
# Spec:: server
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::server' do
#  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
#    platform 'ubuntu', '18.04'

#    it 'converges successfully' do
 #     expect { chef_run }.to_not raise_error
  #  end
 # end

  #context 'When all attributes are default, on an unspecified platform' do
  context 'when on centos' do
#all attributes are default, on an unspecified platform' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'centos', '8'

  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end
  
  it 'installs the correct package' do
    expect(chef_run).to install_package('httpd')
  end
  
  it 'creates an default html file' do
    expect(chef_run).to create_template('/var/www/html/index.html')
  end

  it 'enable the service' do
    expect(chef_run).to enable_service('httpd')
  end

  it 'start the service' do
    expect(chef_run).to start_service('httpd')
  end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

 

  end
end
