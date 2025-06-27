# ------------------------------------------- USER ACCESS -------------------------------------------
IAM (Identitiy and Access Management)  # global service (doesn't depend on region)
Users  # One root user, the rest are IAM users with limited permissions
Groups  # users can be in multiple groups, groups cannot contain other groups
Policies  # policies can be assigned to users or groups. You can use pre-defined policies
          # or create your own assigning permissions of your choice.
UI, Console, SDK(api)  # are the three ways to access aws services
Alias  # you can set for any user for easier access
Roles  # are like groups but they contain permissions for non-user access.
       # example: you can give an ec2 instance permission to access s3 bucket.
