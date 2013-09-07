class people::nejoshi {

    notify { 'class people::nejoshi declared': }
   
    ##################################
    ## Facter, Puppet, and Envpuppet##
    ##################################

    repository { "${::boxen_srcdir}/puppet":
       source => 'puppetlabs/puppet',
    }

    repository { "${::boxen_srcdir}/facter":
       source => 'puppetlabs/facter',
    }

    file { '/bin/envpuppet':
       ensure  => link,
       mode    => '0755',
       target  => "${::boxen_srcdir}/puppet/ext/envpuppet",
       require => Repository["${::boxen_srcdir}/puppet"],
    }

    include chrome
    include github_for_mac
    class { 'intellij':
        edition => 'ultimate',
        version => '12.1.4'
    }
    include istatmenus4
    include java
    include vagrant
    include vim
    vim::bundle { [
      'rodjek/vim-puppet'
    ]: }
    include virtualbox
    include vlc
}
