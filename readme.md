# bash-config

Bundle of useful preferences, aliases, scripts and whatnot commonly referred to  
as dotfiles with an easy "installation" and an as-user-friendly-as-possible  
approach.

## test

Consider running this within the safety of an isolated docker environment before  
you know what you're doing in favor of installing it on your own machine.

```bash
$ make docker-compose-test
```

## removal

No removal tools are available but a look at the installation script should help  
you along determining which files have been created in (or rather, symlinked to)  
the `$HOME` directory.

## installation

If you really want to start using these may I suggest the following?

```bash
$ cd
$ git clone ... bash-config
$ bash-config/bin/install.sh
```

_Existing files should be backed up with a distinctive suffix noting the date
and time of the installation. But don't take my word for it and don't even think
about holding me accountable for countless hours lost fiddling with your set-up._
