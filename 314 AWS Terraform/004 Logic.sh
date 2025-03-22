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

# ---------------------------------------- FUNCTIONS ----------------------------------------
# You can test functions in terraform console
file("userdata.sh")  # print file
toset(["apache", "my_sql", "jumpserver"])  # converts list to set
length(var.instances)
max(-1,4,20,500)  # same with min
ceil(12.4)  # same with floor
split(",", var.my_string)  # converts comma-separated string into list
lower(var.my_var), upper(var.my_var)  # to upper or lowercase
title(var.my_var)  # upper first letter of each word
substr(var.my_string, 0, 3)  # takes piece of string
join["-", var.my_string]  # joins words in var using "-"
length(var.my_string) 
index(var.my_list, "word")  # return index of "word" inside list
element(var.my_list, 2)  # returns element with index 2 from list. Going beyond len goes back to index 0
contains(var.my_list, "some")  # true if some is inside list

# for maps
keys(var.envs)
values(var.envs)
lookup(var.envs, "prod", "dev")  # gets value for "prod" key or uses "dev" if is not found


# ---------------------------------------- CONDITIONS ----------------------------------------
# sets count to 1 or 0 depending on boolean variable
resource "aws_instance" "public_instance" {
  count = var.enable_monitoring ? 1:0
  ...}