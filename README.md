A simple dummy service implementation for Puppet. Useful in contexts
where you don't want Service resources to do anything, for example when
building containers.

## Installation

`dummy_service` is packaged as a Puppet Module, and can be installed from
the Forge like so:

    puppet module install puppetlabs-dummy_service

You can also include in your `Puppetfile` if using r10k or
librarian-puppet:

    mod 'puppetlabs/dummy_service'


## Usage

The module adds a new Service provider to Puppet. Although you can
specify this on a per-resource basis it's probably more likely that you
will use the [resource
defaults](https://docs.puppet.com/puppet/latest/reference/lang_defaults.html)
feature of Puppet like so:

```puppet
Service {
  provider => dummy
}
```

Alternatively you can use [resource collectors](https://docs.puppet.com/puppet/4.5/reference/lang_collectors.html).
This is useful in situations where a module explictly sets a provider
value.

```puppet
Service <| |> { provider => dummy }
```

As a useful shortcut you can also just include the included class:

```puppet
include dummy_service
```

You may decide to include that in several modules and, for instance,
gate it so that services are only clobbered when running under Docker:

```puppet
if $virtual == 'docker' {
  include dummy_service
}
```


## Demonstration

The module contains a quick example in the `examples` directory. You can
see this in action easily with the puppet Docker images.

This example shows what happens when you try and `ensure => running` on
a service which is not configured:

```
docker run --rm -it -v $(pwd):/src/dummy_service:ro puppet/puppet-agent-ubuntu apply /src/dummy_service/examples/without_dummy.pp --test --modulepath=/src
Notice: Compiled catalog for 55b183b19b57.local in environment
production in 0.29 seconds
Info: Applying configuration version '1468839204'
Error: Could not find init script for 'openssh'
Error: /Stage[main]/Main/Service[openssh]/ensure: change from stopped to
running failed: Could not find init script for 'openssh'
Info: Creating state file /opt/puppetlabs/puppet/cache/state/state.yaml
Notice: Applied catalog in 0.03 seconds
```

The following example shows the same resource, but with the dummy
service provider specifed as noted above.

```
docker run --rm -it -v $(pwd):/src/dummy_service:ro puppet/puppet-agent-ubuntu apply /src/dummy_service/examples/with_dummy.pp --test --modulepath=/src
Notice: Compiled catalog for 693fba958896.local in environment
production in 0.30 seconds
Info: Applying configuration version '1468839318'
Info: Creating state file /opt/puppetlabs/puppet/cache/state/state.yaml
Notice: Applied catalog in 0.02 seconds
```


## Thanks

Thanks to @larsks for [originally documenting this idea](http://blog.oddbit.com/2014/10/22/building-docker-images-with-pu/).


## Maintainers

This repository is maintained by: Gareth Rushgrove gareth@puppet.com.
