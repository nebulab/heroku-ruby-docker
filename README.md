# Heroku Ruby Docker

A docker image to mimic Heroku Ruby environment

## Usage

### Create a Dockerfile in your Ruby app project
```dockerfile
FROM nebulab/heroku-ruby:18-2.6.5
...
```

### Run a Ruby script

```sh
$ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/app nebulab/heroku-ruby:18-2.6.5 ruby your-script.rb
```

## Development
Build an image with specific versions
```sh
$ docker build . --build-arg STACK_VERSION=18 --build-arg RUBY_VERSION=2.6.5 -t nebulab/heroku-ruby:18-2.6.5
```

## License

Copyright © 2020 [Nebulab](https://nebulab.it/).
It is free software, and may be redistributed under the terms specified in the [license](LICENSE.txt).

## About

![Nebulab](http://nebulab.it/assets/images/public/logo.svg)

Umarell is funded and maintained by the [Nebulab](http://nebulab.it/) team.

We firmly believe in the power of open-source. [Contact us](https://nebulab.it/contact-us/) if you like our work and you need help with your project design or development.
