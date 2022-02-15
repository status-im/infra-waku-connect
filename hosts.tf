module "hosts" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  /* general */
  env    = "waku"
  stage  = "connect"
  group  = "waku-connect"
  domain = var.domain

  /* scaling */
  host_count = 3
  type       = "s-1vcpu-1gb"

  /* firewall */
  open_tcp_ports = [
    "80",    /* certbot */
    "443",   /* p2p websocket */
    "30303", /* p2p main */
  ]
}
