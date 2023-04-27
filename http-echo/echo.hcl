job "config-file-example" {
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

    template {
        destination = "local/index.html"
        data = file("./index.html")
      }

      config {
        image = "nginx"
        ports = ["http"]
        mounts = [
          {
            type   = "bind"
            source = "local/index.html"
            target = "/usr/share/nginx/html/index.html"
          },
        ]
      }
    }
  }
}
