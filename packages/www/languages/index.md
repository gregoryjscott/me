---
layout: default
title: Languages
desc: List of languages.
_links:
  self:
    href: /languages/
  index:
    - href: /languages/ada/
    - href: /languages/c/
    - href: /languages/cpp/
    - href: /languages/cs/
    - href: /languages/css/
    - href: /languages/delphi/
    - href: /languages/fortran/
    - href: /languages/html/
    - href: /languages/java/
    - href: /languages/js/
    - href: /languages/pascal/
    - href: /languages/php/
    - href: /languages/plsql/
    - href: /languages/py/
    - href: /languages/rb/
    - href: /languages/sql/
    - href: /languages/ts/
    - href: /languages/tsql/
    - href: /languages/vb/
---

<a href="{{ site.url }}">Home</a> / <a href="{{ page.url }}">{{ page.title }}</a>

{% include basic-info.html %}

{% for item in page._embedded.index %}
{% include languages/summary.html language=item %}
{% endfor %}
