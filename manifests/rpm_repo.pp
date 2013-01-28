class varnish_rhel::rpm_repo($rhel_major = 6) {
  yumrepo { "varnish-cache":
    baseurl  => "http://repo.varnish-cache.org/redhat/varnish-3.0/el$rhel_major/",
    descr    => "Varnish-cache RPM repository",
    enabled  => 1,
    gpgcheck => 0
  }
}
