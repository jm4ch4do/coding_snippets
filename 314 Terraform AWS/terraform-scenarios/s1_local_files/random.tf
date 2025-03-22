# resource "random_string" "suffix-1" {
#     length = 4
#     special = false
#     upper = false
#     numeric = false
# }

# resource "random_string" "suffix-2" {
#     length = 4
#     special = false
#     upper = false
#     numeric = false
# }

resource "random_string" "suffix" {
  count   = 5
  length  = 4
  special = false
  upper   = false
  numeric  = false
}
