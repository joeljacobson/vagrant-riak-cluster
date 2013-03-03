# Vagrant Riak Cluster

This is a Chef repository to bring up a Riak cluster within Vagrant. Each node
will run Ubuntu `12.04 64-bit` with `1024MB` of RAM by default. If you wish
to tune the node or memory count, you'll have to edit the `Vagrantfile`
directly.

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

### Launching individual nodes

Each node in the cluster is named in the form `riakN` — where `N` is a number
between `1` and the number of nodes defined for the cluster (defaults to `3`).

``` bash
$ vagrant ssh riak1
```

## Erlang Template Helper

In order to set the appropriate Erlang data type for attributes, please use the
methods provided by the `erlang_template_helper`:

* `to_erl_string`
* `to_erl_binary`
* `to_erl_tuple`
* `to_erl_list`
