# Sky is the limit, let's bring that limit higher
service { 'nginx':
  ensure => running,
}

exec { 'increase ULIMIT':
  command  => 'sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4000\"/g" /etc/default/nginx',
  provider => 'shell',
  notify   => Service['nginx']
}
