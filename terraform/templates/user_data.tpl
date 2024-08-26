#cloud-config
hostname: ${host_name}
manage_etc_hosts: true
users:
  - name: vmuser
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ${auth_key}
ssh_pwauth: true
disable_root: false
chpasswd:
  list: |
    vmuser:p@ssw0rd
  expire: false
growpart:
  mode: auto
  devices: ['/']