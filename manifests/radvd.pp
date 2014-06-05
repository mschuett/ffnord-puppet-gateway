define ffnord::radvd (
    $ipv6_address,
    $ipv6_prefix
  ) {

  include ffnord::radvd::base
  include ffnord::resources::radvd

  $interface = $name

  File['/etc/radvd.conf.d']
  ->
  file { "/etc/radvd.conf.d/interface-${name}.conf": 
       ensure => file,
       content => template('ffnord/etc/radvd.conf.erb');
  }  
  ->
  Class[ffnord::resources::radvd]
  -> 
  Service[radvd]
}

class ffnord::radvd::base () {

  file { 
    '/etc/radvd.conf.d':
      ensure => directory,
      mode => "0755";
  }
  package { 
    'radvd': 
      ensure => installed,
      require => File['/etc/radvd.conf.d']; 
  }
  service { 
    'radvd': 
      enable => true, 
      ensure => running,
      require => Package['radvd']; 
  }
}