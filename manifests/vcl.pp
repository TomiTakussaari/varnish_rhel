define varnish_rhel::vcl(
  $vcl_file_name = $title,
  $vcl_content) {

  File {
    require => Package['varnish']
  }

  file { "$vcl_file_name":
    content => $vcl_content,
    notify  => Service['varnish'],
    owner   => "root",
    group   => "root"
  }
}
