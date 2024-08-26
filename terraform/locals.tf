locals {
    prefix = "tms"

    pool = {
        path = "/var/lib/libvirt"
        img_source = "/images/jammy-server-cloudimg-amd64.img"
        img_format = "qcow2"
    } 

    vms = [
        {
            name = "appsrv1"
            mac = "52:54:00:D0:4C:6D"
            vl_size = 10 * 1024 * 1024 * 1024 # volume size in bytes
            mem_size = "512"
            cpu_cores = 1
        },
        {
            name = "appsrv2"
            mac = "52:54:00:F1:7F:61"
            vl_size = 10 * 1024 * 1024 * 1024
            mem_size = "512"
            cpu_cores = 1
        },
        {
            name = "gatesrv1"
            mac = "52:54:00:B6:59:8C"
            vl_size = 10 * 1024 * 1024 * 1024
            mem_size = "1024"
            cpu_cores = 1
        },
        {
            name = "gatesrv2"
            mac = "52:54:00:1C:CC:4C"
            vl_size = 10 * 1024 * 1024 * 1024
            mem_size = "1024"
            cpu_cores = 1
        },
    ]

    # The VM dhcp addresses predefined on the virsh net
    # <host mac='52:54:00:D0:4C:6D' name='tms-appsrv1' ip='192.168.122.11'/>
    # <host mac='52:54:00:F1:7F:61' name='tms-appsrv2' ip='192.168.122.12'/>
    # <host mac='52:54:00:05:2D:50' name='tms-appsrv3' ip='192.168.122.13'/>
    # <host mac='52:54:00:B6:59:8C' name='tms-gatesrv1' ip='192.168.122.21'/>
    # <host mac='52:54:00:1C:CC:4C' name='tms-gatesrv2' ip='192.168.122.22'/>
    # <host mac='52:54:00:4C:B0:27' name='tms-mysql1' ip='192.168.122.31'/>
    # <host mac='52:54:00:4C:B1:27' name='tms-mysql2' ip='192.168.122.32'/>

}