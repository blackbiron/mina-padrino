# mina-padrino

* [Homepage](https://github.com/postmodern/mina-padrino#readme)
* [Issues](https://github.com/postmodern/mina-padrino/issues)
* [Documentation](http://rubydoc.info/gems/mina-padrino/frames)
* [Email](mailto:postmodern.mod3 at gmail.com)

## Description

[Mina][mina] tasks for deploying [Padrino][padrino] apps.

## Features

* Sets `RACK_ENV=`

### Tasks

Mina Task                | Command
-------------------------|-----------------
`padrino:console`        | `padrino console`
`padrino:db:migrate`     | `rake db:migrate`
`padrino:db:create`      | `rake db:create`
`padrino:db:drop`        | `rake db:drop`
`padrino:db:reset`       | `rake db:reset`
`padrino:db:setup`       | `rake db:setup`
`padrino:db:seed`        | `rake db:seed`

## Examples

    require 'mina/padrino'

    desc "Deploys the current version to the server."
    task :deploy => :environment do
      deploy do
        # Put things that will set up an empty directory into a fully set-up
        # instance of your project.
        invoke :'git:clone'
        invoke :'deploy:link_shared_paths'
        invoke :'bundle:install'
        invoke :'deploy:cleanup'
        invoke :'padrino:db:migrate'

        ...
      end
    end


## Requirements

* [mina] ~> 0.3

## Install

    $ gem install mina-padrino

## Gemfile

    gem 'mina-padrino', require: false

## Copyright

Copyright (c) 2015 Hal Brodigan

See {file:LICENSE.txt} for details.

[mina]: http://mina-deploy.github.io/mina/
[padrino]: http://www.padrinorb.com/
