# Broadcaster
Broadcast Email from Amazon SES.

## Setup
```
$ bundle install --path=vendor/bundle
```

## Run
```
$ AWS_ACCESS_KEY_ID='XXXXXXXX' AWS_SECRET_ACCESS_KEY='XXXXXXXXXXXXXXXX' bundle exec bin/broadcaster -s source/xxx.tsv -t template/xxx.erb
```

### Options
```
Usage: broadcaster [options]
    -s, --source=SOURCE_FILE
    -t, --template=TEMPLATE_FILE
    -i, --interval=INTERVAL(sec)
```

## File format
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
