node[:stunnel][:packages].each do |s_pkg|
  package s_pkg
end

directory '/etc/stunnel' do
  owner 'root'
  group 'root'
  mode 00755
  action :create
end

user node[:stunnel][:user] do
  home '/etc/stunnel'
  system true
  shell '/bin/false'
  comment 'stunnel user'
end

template '/etc/stunnel/stunnel.conf' do
  source 'stunnel.conf.erb'
  mode 0644
  variables({
    stunnel: node[:stunnel]
  })
  action :create
end
