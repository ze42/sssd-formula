{% from 'sssd/map.jinja' import sssd %}

include:
  - .packages

sssd_config:
  file.managed:
    - name: {{ sssd.sssd_config }}
    - template: jinja
    - source: salt://{{ slspath }}/files/sssd.conf
    - require:
      - sls: sssd.packages

sssd_service:
  service.running:
    - name: {{ sssd.service }}
    - watch:
      - sls: sssd.packages
      - file: sssd_config
