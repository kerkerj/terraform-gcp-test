
data "local_file" "startup_script" {
  filename = "${path.module}/scripts/startup.sh"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
  name         = "golang-vm-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone         = "asia-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Make sure flask is installed on all new instances for later steps
  metadata_startup_script = "${data.local_file.startup_script.content}"

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  metadata {
    sshKeys = "${var.ssh_keys}"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-rw"] // read bucket for Cloud Registry
  }

  allow_stopping_for_update = true
}

resource "google_compute_firewall" "default" {
  name    = "allow-go"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
}
