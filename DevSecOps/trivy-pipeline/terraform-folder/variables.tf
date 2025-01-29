# variables.tf
variable "trivy_container_name" {
  description = "Container name to be populated by CodeBuild"
  type        = string
  default     = "trivy-test"
}

variable "github_repo_owner" {
  description = "GitHub repository owner"
  type        = string
}

variable "github_repo_name" {
  description = "GitHub repository name"
  type        = string
}

variable "github_oauth_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}
