resource "google_artifact_registry_repository" "hack-aso-grupo-01-repo" {
  location = "us-central1"
  repository_id = "hack-aso-grupo-01"
  description = "imagens docker"
  format = "DOCKER"
}

resource "google_sql_database" "database" {
  name     = "db-database"
  instance = google_sql_database_instance.instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  name             = "db-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}