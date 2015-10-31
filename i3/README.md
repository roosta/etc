i3-wm configuration
---
Configuration file is assembled by ansible with use of a jinja template, and host spesific variables.
To modify the configuration make the changes to ./config.j2 and re-render using:
```shell
ansible dotfiles.yml -t i3
```

When modifying configuration always edit \*.j2 files. All \*.gen files is generated on each task run and should be considered a temporary file. Also remember to point i3 to the correct config file. i.e.
```shell
exec i3 -c ~/.i3/config.gen
```
templates use jinja2 syntax and docs can be found [here](http://jinja.pocoo.org/docs/dev/templates/#)
