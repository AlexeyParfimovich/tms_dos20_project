[vm_web]
%{ for vm in tms_appsrvs ~}
${vm.id} ansible_host=${vm.ip}
%{ endfor ~}

[vm_haproxy]
%{ for vm in tms_gatesrvs ~}
${vm.id} ansible_host=${vm.ip}
%{ endfor ~}

[vm_keepalived]
%{ for vm in tms_gatesrvs ~}
${vm.id} ansible_host=${vm.ip}
%{ endfor ~}

[vm_all:children]
vm_web
vm_haproxy
