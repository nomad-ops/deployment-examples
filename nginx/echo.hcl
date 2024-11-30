job "nginx" {
  datacenters = ["dc1"]

  group "example" {
    network {
      port "http" {
        static = "5679"
        to = 80
      }
    }
    task "server" {
      driver = "docker"

      config {
        image = "nginx"
        ports = ["http"]
      }
    }
  }
}
