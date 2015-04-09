define passwordusername::user (
  $username = $title,
) {


  # pw_hash is a function in stdlib - not yet shipped
  # see docs for more: https://github.com/puppetlabs/puppetlabs-stdlib
  # copied from https://github.com/puppetlabs/puppetlabs-stdlib/blob/master/lib/puppet/parser/functions/pw_hash.rb
  $password = pw_hash($username, 'SHA-512', 'salt')

  user { "${username}":
    ensure => present,
    password => $password,
  }

}
