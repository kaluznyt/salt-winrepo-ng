# both 32-bit (x86) AND a 64-bit (AMD64) installer available
{% set PROGRAM_FILES = "%ProgramFiles%" %}
git:
  {% for version in ['2.15.0','2.14.2', '2.13.3', '2.13.1.2', '2.12.2', '2.12.1', '2.11.0.3', '2.11.0', '2.10.2', '2.10.1', '2.10.0', '2.9.0', '2.8.4', '2.8.3', '2.8.2', '2.8.1', '2.7.2', '2.7.1', '2.7.0', '2.6.4', '2.6.2', '2.5.3', '2.5.2.2', '2.5.0'] %}
    {% if version.count('.') == 3  %}
      {% set short_version = version[:-2] %}
      {% set win_ver = version[-1:] %}
    {% else %}
      {% set short_version = version %}
      {% set win_ver = "1" %}
    {% endif %}
  '{{ version }}':
    full_name: 'Git version {{ version }}'
    {% if grains['cpuarch'] == 'AMD64' %}
    installer: 'https://github.com/git-for-windows/git/releases/download/v{{ short_version }}.windows.{{ win_ver }}/Git-{{ version }}-64-bit.exe'
    {% elif grains['cpuarch'] == 'x86' %}
    installer: 'https://github.com/git-for-windows/git/releases/download/v{{ short_version }}.windows.{{ win_ver }}/Git-{{ version }}-32-bit.exe'
    {% endif %}
    install_flags: '/VERYSILENT /NORESTART /SP- /NOCANCEL'
    uninstaller: '{{ PROGRAM_FILES }}\Git\unins000.exe'
    uninstall_flags: '/VERYSILENT /NORESTART & {{ PROGRAM_FILES }}\Git\unins001.exe /VERYSILENT /NORESTART & exit 0'
    msiexec: False
    locale: en_US
    reboot: False
  {% endfor %}
msysgit:
  '1.9.5-preview20150319':
    full_name: 'Git version 1.9.5-preview20150319'
    installer: 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.5-preview20150319/Git-1.9.5-preview20150319.exe'
    install_flags: '/VERYSILENT /NORESTART /SP- /NOCANCEL'
    uninstaller: '{{ PROGRAM_FILES }}\Git\unins000.exe'
    uninstall_flags: '/VERYSILENT /NORESTART '
    msiexec: False
    locale: en_US
    reboot: False
  '1.9.5-preview20141217':
    full_name: 'Git version 1.9.5-preview20141217'
    installer: 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.5-preview20141217/Git-1.9.5-preview20141217.exe'
    install_flags: '/VERYSILENT /NORESTART /SP- /NOCANCEL'
    uninstaller: '{{ PROGRAM_FILES }}\Git\unins000.exe'
    uninstall_flags: '/VERYSILENT /NORESTART'
    msiexec: False
    locale: en_US
    reboot: False
  '1.9.4-preview20140815':
    full_name: 'Git version 1.9.4-preview20140815'
    installer: 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.4-preview20140815/Git-1.9.4-preview20140815.exe'
    install_flags: '/VERYSILENT /NOREBOOT'
    uninstaller: '{{ PROGRAM_FILES }}\Git\unins000.exe'
    uninstall_flags: '/VERYSILENT /NOREBOOT'
    msiexec: False
    locale: en_US
    reboot: False
