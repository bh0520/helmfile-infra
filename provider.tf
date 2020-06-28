provider "google" {
}
provider "kubernetes" {
  load_config_file = false
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.current.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
}
