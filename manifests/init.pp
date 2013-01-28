class varnish_rhel(
  $varnish_data_directory,
  $varnish_listen_port = 80,
  $varnish_storage_size = "1G"
  ) {
  require varnish_rhel::rpm_repo

  File {
    owner => root,
    group => root,
    ensure => present,
  }

  file { "$varnish_data_directory":
    ensure => "directory",
  }

  package { "varnish":
    ensure  => latest,
    require => File["$varnish_data_directory"]
  }

  service { "varnish":
    ensure    => "running",
    hasstatus => true,
    enable    => true,
    require   => Package["varnish"]
  }

  file { "varnish-sysconfig":
    path    => "/etc/sysconfig/varnish",
    content => template("varnish_rhel/etc/sysconfig/varnish.erb"),
    require => Package["varnish"],
    notify  => Service["varnish"],
    owner   => "root",
    group   => "root",
  }
}
