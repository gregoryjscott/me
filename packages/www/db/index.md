---
layout: default
title: Databases
desc: List of databases.
_links:
  self:
    href: /db/
  index:
    - href: /db/access/
    - href: /db/bigquery/
    - href: /db/btrieve/
    - href: /db/oracle/
    - href: /db/pervasive/
    - href: /db/postgres/
    - href: /db/sql-server/
    - href: /db/sqlite/
---

<a href="{{ site.url }}">Home</a> / <a href="{{ page.url }}">{{ page.title }}</a>

{% include basic-info.html %}

{% for item in page._embedded.index %}
{% include db/summary.html db=item %}
{% endfor %}
