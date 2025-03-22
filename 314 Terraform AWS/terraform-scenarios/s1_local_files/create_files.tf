# resource "local_file" "product-1" {
#     content = "product list and description"
#     filename = "productos-${random_string.suffix-1.id}.txt"
# }

# resource "local_file" "product-2" {
#     content = "product list and description"
#     filename = "productos-${random_string.suffix-2.id}.txt"
# }

resource "local_file" "products" {
  count    = 5
  content  = "product list and description"
  filename = "productos-${random_string.suffix[count.index].id}.txt"
}