# --- CONFIG ACCOUNT
IAM Service  # Identity and Access Management

    # CREATE user for console access (in UI)
    NEW_ALIAS # So you don't need to remember the account id
    NEW_USER AdministratorAccess  # assign for full access
    # Note: Activate if needed "IAM user and role access to Billing Information"

    
# --- CREATE BUDGET
# Top right, Account -> Budgets (Left Menu)    

# --- DOWNLOAD AWS CLI
choco install awscli
aws --version
# create access key in UI
aws configure  # connects cmd to aws
 aws sts get-caller-identity  # retrieve user info to verify connection