resource "google_compute_instance" "default" {
  name         = "gdg-kolachi-2019"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  tags = ["gdg"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20190628"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    name     = "gdg-kolachi-2019"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  metadata_startup_script = <<-EOF
              #!/bin/bash
              echo "Hello, GDG Kolachi 2019" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

}