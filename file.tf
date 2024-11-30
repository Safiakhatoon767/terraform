resource "local_file" "my_file" {
  filename = "devops.txt"   # Correct argument name
  content  = "This is a Terraform Auto-generated file."
}
