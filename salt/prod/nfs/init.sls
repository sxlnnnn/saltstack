nfs-install:
  pkg.installed:
    - names:
      - rpcbind
      - nfs-utils

/etc/exports:
  file.append:
    - text:
      -  "/web    *(rw,sync,all_squash)"

rpcbind-service:
  service.running:
    - name: rpcbind
    - enable: True
    - reload: True

nfs-service:
  service.running:
    - name: nfs
    - enable: True
    - reload: True
    - watch:
      - file: /etc/exports
