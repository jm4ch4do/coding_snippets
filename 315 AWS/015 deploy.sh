# ---------------------------------------- INFRASTRUCTURE AS CODE ------------------------------------
CloudFormation                 # AWS Infrastructure as Service solution (like Terraform)
Infrastructure_Composer        # Visual representation of CloudFormation deployment
CDK (Cloud_Development_Kit)    # Define infrastructure using a familiar language like python, javascript, etc
                               # Code is complite into a Json/Yaml to be passed to Cloud Formation.

Beanstalk                      # Developer centric view of deploying and application. Is Platform as a Service.
                               # You get a 3-tier Web App but with less config to do: ELB(Balancer) + AutoScalingGroup(with EC2s) + DBs
                               # Free managed service but you pay for the deployed instances. Deploy is also made by Cloud Formation.
                               # Also includes application monitoring with health agent that pushes metrics to CloudWatch.
  - Architecture_Models
    * Single Instance          # Good for dev
    * LB + ASG:                # Web Production
    * ASG only                 # Non-Web Production (like workers)

CodeDeploy                     # Automatically deploys applications both in cloud and on-premises.
                               # Instances must be provisioned ahead of time with the CodeDeploy agent.
                               # Doesn't use Cloud Formation

# --------------------------------------------- CODE RELATED -----------------------------------------
CodeCommit(discontinued)       # AWS github equivalent, easily integrates with rest of services.
CodeBuilt                      # AWS CI/CD solution. Compiles source code, run tests, produces packages. (Like the Jenkins Build Step)
                               # Fully managed and serverless. Only pay for build time.
CodePipeline                   # Orchestrates the Pipeline (like Jenkins Pipeline Orchestrator)
                               # Takes code from CodeCommit, builds with CodeBuild, deploys with CodeDeploy, provisions with Beanstalk
CodeArtifact                   # Handles artifact(dependecies) management. Works with common dependecy tools like pip, npm, maven, etc

AWS Systems Manager            # Manages servers EC2 or On-Premises using and agent. Works for Linux, Windows, MacOs.
                               # - Handles patching automation   - Run commands across entire fleet   - Stores parameter configurations
- SM Session Manager           # Can start a shell in EC2 or on-premises without need of SSH.
- SM Parameter Store           # Secure Storage for Configuration and secrets. (like Vault)