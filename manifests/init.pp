
class dummy_service {
  # It's common for systemd services to need to refresh systemctl
  # by always returning true we avoid issues with what in the context
  # of this module are unhelpful execs
  file { '/bin/systemctl':
    ensure => link,
    target => '/bin/true',
  }
  # This service provider does nothing and is helpful when you don't
  # want to modify an upstream module but you also don't want any service
  # resources to take effect, for instance when building container images.
  #
  # We use resource collectors rather than resource defaults because the former
  # are not scoped to the class but to the entire run
  Service <| |> { provider => dummy }

  notify { 'All Service resources replaced with dummy provider': }
}
