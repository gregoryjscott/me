---
layout: default
title: Schools
desc: List of schools.
_links:
  self:
    href: /schools/
  index:
    - href: /schools/uco/
---

<a href="{{ site.url }}">Home</a> / <a href="{{ page.url }}">{{ page.title }}</a>

{% include basic-info.html %}

{% for item in page._embedded.index %}
{% include schools/summary.html school=item %}
{% endfor %}
