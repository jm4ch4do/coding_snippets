"------------------------STANDARD SYNTAX-------------------------"
block_type "label" "name_label" {
    
    key = "value"
    
    nested_block {
    
        key = "value"
        
    }
}

"------------------------EXAMPLE-------------------------"
#        resource_type      name
resource "aws_instance" "web_server" {

    name = "web-server"  # name displayed in the aws-console
    
    ebs_volume {
        
        size = 40
    
    }
}

"-------------------REFERING TO AN OBJECT--------------------"
<resource_type>.<name_label>.<attribute>  # attribute is optional
aws_instance.web_server.name