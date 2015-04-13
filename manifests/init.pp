# == Class: trustanchors
#
# Full description of class trustanchors here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { trustanchors:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#
class trustanchors (
  ensure
  ) {
  yumrepo{ 'EGI-trustanchors':
    descr    => 'EGI-trustanchors',
    baseurl  => 'http://repository.egi.eu/sw/production/cas/1/current/',
    gpgcheck => '1',
    gpgkey   => 'http://repository.egi.eu/sw/production/cas/1/GPG-KEY-EUGridPMA-RPM-3',
    enabled  => '1',
  }
  
  package { 'ca-policy-egi-core':
    ensure => $ensure,
    require => Yumrepo["EGI-trustanchors"]
  }
}
