#
# Cookbook:: .
# Recipe:: server
#
# Copyright:: 2019, The Authors, All Rights Reserved.
package 'httpd'

#cookbook_file '/var/www/html/index2.html' do
#        source 'index2.html'
#end

remote_file '/var/www/html/my.png' do
        source 'https://images.unsplash.com/photo-1550028061-1de667deea35?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'
end

template '/var/www/html/index.html' do
        source 'index.html.erb'
        variables(
                :name=> "Balkar Singh"
        )
        action :create
#       notifies :restart, 'service[httpd]', :immediately
end

service 'httpd' do
        action [:enable, :start]
        subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end

