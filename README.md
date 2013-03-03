# Vagrant Riak Cluster

This is a Vagrant project powered by Chef to bring up a local Riak cluster.
Each node can run either `Ubuntu 12.04` or `CentOS 6.3` 32-bit with `1024MB`
of RAM by default. If you want to tune the OS or node/memory count, you'll
have to edit the `Vagrantfile` directly.

## Configuration

### Install Vagrant

Download and install Vagrant via the
[Vagrant installer](http://downloads.vagrantup.com/).

### Install cookbooks

``` bash
$ gem install bundler
$ bundle install
$ bundle exec berks install
```

### Launch cluster

``` bash
$ vagrant up
```

### Accessing individual nodes

Each node in the cluster is named in the form `riakN` — where `N` is a number
between `1` and the number of nodes defined for the cluster (defaults to `3`).

``` bash
$ vagrant ssh riak1
```

## Erlang template helper

In order to set the appropriate Erlang data types for attributes, please use
the following methods provided by `erlang_template_helper`:

* `to_erl_string`
* `to_erl_binary`
* `to_erl_tuple`
* `to_erl_list`

## How is this better than `make devrel`?

Standing up a local Riak cluster within Vagrant is better than `make devrel` because:

* Opportunity to install Riak on the operating system you intend to deploy with
* Opportunity to use the actual packages you'll deploy with in production
* Test failure scenarios that include the machine (failed disks, network partitions, etc)
* Test with different resource allocations

## How is this worse than `make devrel`?

* Takes longer to stand up a cluster
* Uses more resoruces on your local machine
* Involves VirtualBox
