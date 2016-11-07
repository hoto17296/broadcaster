# Broadcaster
## Setup
```
$ bundle install --path=vendor/bundle
```

## Run
```
$ bundle exec bin/broadcaster -c config/xxx.yml -s source/xxx.tsv -t template/xxx.erb
```

### Options
```
Usage: broadcaster [options]
    -c, --config=CONFIG_FILE
    -s, --source=SOURCE_FILE
    -t, --template=TEMPLATE_FILE
    -i, --interval=INTERVAL(sec)
    -v, --verbose
        --dry-run
```

## File format
### Config
YAML

``` yaml:source/sample.yml
domain: example.com
port: 25
helo_domain: mail.example.com
account: foo
password: bar
```

Params are same as [Net::SMTP.start](https://docs.ruby-lang.org/ja/latest/method/Net=3a=3aSMTP/s/start.html).

### Sourse
TSV

``` tsv:source/sample.tsv
email	name
foo@example.com Foo
bar@example.com Bar
```

### Template
ERB + Frontmatter

``` erb:source/sample.erb
<%#
---
from: noreply@example.com
subject: おしらせ
---
%>
<%= name %> 様

おしらせです
```
