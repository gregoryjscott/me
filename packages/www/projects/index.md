---
layout: default
title: Projects
desc: List of projects.
_links:
  self:
    href: /projects/
  projects:
    - href: /projects/agdc/
    - href: /projects/ahfc-integration/
    - href: /projects/awwu-intranet/
    - href: /projects/awwu-job-scheduler/
    - href: /projects/awwu-systems-integration/
    - href: /projects/backup-controls-displays/
    - href: /projects/bit-proposal/
    - href: /projects/centroid/
    - href: /projects/cis-data-capture/
    - href: /projects/class-scheduler/
    - href: /projects/consumption-views/
    - href: /projects/database-sync-awwu/
    - href: /projects/denver-schedules-api/
    - href: /projects/employee-suggestions/
    - href: /projects/energy-efficiency-map/
    - href: /projects/epicloud/
    - href: /projects/flir-monitoring/
    - href: /projects/lasar-range-finder/
    - href: /projects/mission-data-loader/
    - href: /projects/mvc-integration-test-framework/
    - href: /projects/please/
    - href: /projects/qb/
    - href: /projects/report-engine/
    - href: /projects/sar-reports/
    - href: /projects/scramble-score/
    - href: /projects/scrum-tools/
    - href: /projects/sif-agent/
    - href: /projects/simpler/
    - href: /projects/smf-controls-displays/
    - href: /projects/somd/
    - href: /projects/systems-portal/
    - href: /projects/this-site/
    - href: /projects/train-builder/
    - href: /projects/wengage-acct/
    - href: /projects/wengage-si/
---

<nav>
  <a href="{{ site.url }}">Home</a> /
  <a href="{{ page.url }}">{{ page.title }}</a>
</nav>

{% include basic-info.html %}

{% for item in page._embedded.projects %}
{% include projects/summary.html project=item heading_level=2 %}
{% endfor %}
