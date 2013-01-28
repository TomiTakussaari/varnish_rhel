# Varnish for RHEL

## This Puppet Forge module allows you to...

* Install Varnish 3.0
* Define where Varnish stores the data
* Which port Varnish listens to
* How much storage Varnish uses

## Usage

    # In site.pp
    node cache-node {
      class { "varnish_rhel":
        varnish_data_directory => "/opt/varnish",
        varnish_storage_size   => "5G",
        varnish_listen_port    => 80
      }
    }

    varnish_rhel::vcl { '/etc/varnish/default.vcl':
      vcl_content => template('your-varnish-module/etc/varnish/default.vcl.erb')
    }
    
    varnish_rhel::vcl { '/etc/varnish/backend.vcl':
      vcl_content => template('your-varnish-module/etc/varnish/backend.vcl.erb')
    }

The example above assumes that you have a Puppet module *your-varnish-module*
which has templates */etc/varnish/default.vcl.erb* and */etc/varnish/backend.erb*

## Install

    puppet module install tomitakussaari/varnish_rhel

## Links

This project on Puppet Forge:
<http://forge.puppetlabs.com/tomitakussaari/varnish_rhel>.

## License

See the file LICENSE (it's MIT).
