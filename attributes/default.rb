case node.platform_family
when 'debian'
    default[:stunnel][:packages] = %w(stunnel4)
else
    default[:stunnel][:packages] = %w(stunnel)
end

default[:stunnel][:user] = 'stunnel'
default[:stunnel][:global][:setuid] = 'stunnel'
default[:stunnel][:global][:setgid] = 'stunnel'
default[:stunnel][:global][:socket] = ['l:TCP_NODELAY=1', 'r:TCP_NODELAY=1']
default[:stunnel][:global][:verify] = 2
