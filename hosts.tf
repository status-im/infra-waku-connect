module "nim_waku_nodes" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* general */
  name   = "nim"
  env    = "waku"
  stage  = "connect"
  group  = "nim-waku-connect"
  domain = var.domain

  /* scaling */
  host_count = 1
  ac_type    = "ecs.t5-lc1m1.small"
  do_type    = "s-1vcpu-1gb"
  gc_type    = "g1-small"

  /* firewall */
  open_tcp_ports = [
    "80",    /* certbot */
    "443",   /* p2p websocket */
    "30303", /* p2p main */
  ]
}
