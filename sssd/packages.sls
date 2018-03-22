{% from 'sssd/map.jinja' import sssd %}

sssd_packages:
  pkg.installed:
    - pkgs: {{ sssd.packages|json }}
