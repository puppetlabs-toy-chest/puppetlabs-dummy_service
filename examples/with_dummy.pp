Service {
  provider => dummy
}

Service { 'openssh':
  ensure => running,
}
