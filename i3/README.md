i3-wm configuration
---
Config file is assembled by ansible from template fragements.
Bar fragments are located in ./bar and main configuration is config.j2.

When editing config always edit \*.j2 files. All \*.gen files is generated on each task run and should be considered a temporary file. Also remember to point i3 to the correct config file ie:
```shell
exec i3 -c ~/.i3/config.gen
```
templates use jinja2 syntax and docs can be found [here](http://jinja.pocoo.org/docs/dev/templates/#)

*for config assembly details see: dotfiles/tasks/i3.yml*
