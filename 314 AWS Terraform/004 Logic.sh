# ------------------------------------------ COUNT ------------------------------------------
# Used with vars type list
# Creates 3 of the same resource (not recommended
# since it indexes with nums as [0], [1], [2] which is confusing)
instances = ["apache", "mysql", "jumpserver"]
resource "aws_instance" "public_instance" {
  count         = 3
  ...}

# Creates a server per each name in variable
count = length(var.instances)

# Names the instances accoding to names in variables
  tags = { "Name" = var.instances[count.index] }  # not recommended, use for each instead


# ---------------------------------------- FOR EACH ----------------------------------------
# Uses with vars type set or dict
instances = ["apache", "mysql", "jumpserver"]  # type = set(string)
resource "aws_instance" "public_instance" {
  for_each         = var.instances
  tags = { "Name" = each.value }
  ...}