{% from 'sssd/map.jinja' import sssd %}
{% from 'sssd/map.jinja' import defaults %}
{% set config = salt['pillar.get']('sssd:config', {}) %}

{% if config.get('nsswitch', {}).get('configure', defaults.nsswitch.configure) %}
{% set nsswitch_databases = config.get('nsswitch', {}).get('databases', defaults.nsswitch.databases) %}

# suppress it from un-specified databases
sssd_nsswitch_disable_on_databases:
  file.replace:
    - name: {{ sssd.nsswitch_config }}
    - ignore_if_missing: True
    - pattern: "^((?!({{ nsswitch_databases | join ('|') }})[ \t]*:).+:[ \t]*)(.*)(?:(?<![ \t])[ \t]*\\b{{ sssd.nsswitch_module }}\\b)(.*)"
    - repl: "\\1\\3\\4"
    - ignore_if_missing: True

# appends it to specified databases
sssd_nsswitch_activate_databases:
  file.replace:
    - name: {{ sssd.nsswitch_config }}
    - pattern: "^(({{ nsswitch_databases | join ('|') }})[ \t]*:(?!.*\\b{{ sssd.nsswitch_module }}\\b).*)"
    - repl: "\\1 {{ sssd.nsswitch_module }}"
    - ignore_if_missing: True
{% endif %}
