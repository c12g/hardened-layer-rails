# README

Hardened Layer is a custom portal for SoftLayer cloud service.

currently, It supports RESTful API for SoftLayer.  SoftLayer also provides
REST API but I think it is not a RESTful one. (It is just a Wrapped API of
XML-RPC API, I think.)


## Install and Configuration

1. Just clone it and setup rails/bundle.
1. Rename `/config/application.yml.template` to `/config/application.yml`
and edit it.
1. Run `bundle exec rails server` and go!

There is no Database setup because it just uses **SoftLayer's Ruby API**
as Backend and there is no local data yet. (but as you see, project name
is "Hardened Layer" so sometime later, I will add something special.

## Environment

It developed with:

* Ruby 2.1.2p95 (2014-05-08), the version from Ubuntu 15.04.
* Rails 4.2.5, the version from current Gem repository.

## Limitations

* No Testcase provided.
* No Test site are available.

## Todo

- [ ] Simple UI with Ember.
- [ ] More browsing API support.
- [ ] Creation and Deletion support.
- [ ] Management support including reboot, shutdown,...
- [ ] Provides monitoring statistics for each VMs.
- [ ] Test on Heroku and other PaaS.

## Resources


## Special Thanks to

* My grand boss :-(

