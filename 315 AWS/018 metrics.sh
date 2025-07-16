# ----------------------------------------------- METRICS --------------------------------------------
CloudWatch Metrics               # CloudWatch provides metrics for every service in AWS. 
                                 # You can create Dashboards to visualize the most importante ones.
                                 # Alarms can be set on thresholds for any metric. Billing alarms can only be set on us-east1
CloudWatch Logs                  # Can collect logs for real time monitoring. From Beanstalk, ECS, Lambda, CloudTrail, Route53.
                                 # For EC2 instances you need to install an agent.
EventBridge                      # Trigger actions: lambda, SNS ... based on events: cron, user sign in ...
                                 # You can also receive events from third parties or your custom application.
CloudTrail                       # Enabled by default. Records a history of all events and API calls. Information can be sent to CloudWatch.


# ------------------------------------------------- CODE ---------------------------------------------
X-Ray                            # Visual analysis of your distributed applications for understanding dependencies or troubleshooting.
CodeGuru                         # AI that does automatic code reviews and performance recommendations.


# ------------------------------------------------ OTHERS --------------------------------------------
Health Dashboard                 # Shows general health information for all regions and all services.
  - Your Account                 # Provides alerts and remediation when AWS is experiencing events that may impact you. Proactive and Reactive.
                                 # Can be accessed from the bell icon at the top right.

















