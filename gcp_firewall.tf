resource "google_compute_firewall" "default" {
  name    = "gdg-kolachi-2019"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
}