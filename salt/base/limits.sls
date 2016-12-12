/etc/security/limits.conf:
    file.append:
    - text:
      - "* soft nofile 65535"
      - "* hard nofile 65535"
      - "* soft nproc 65535"
      - "* hard nproc 65535"
