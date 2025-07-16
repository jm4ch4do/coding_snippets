# --------------------------------------------- INTEGRATION ------------------------------------------
# Communications can be synchronous or asynchronous (event based) where they is a queue before receiving service.

SQS (Simple_Queue_Service)          # Async service that allows to have a queue of requests.
  - Standard Queue                  # Managed, serveless service. Can scale when needed. 
                                    # Used to decouple between application tiers, 
                                    # meaning that blocks will not be connected directly but having a queue in between
  - FIFO                            # First In First Out. Order is preserved. Standard queue doesn't guarantee that.

Kinesis                             # Real time big data streaming at any scale.
  - Data Firehose                   # Load Kinesis data streams into Amazon S3, Redshift, OpenSearch

SNS (Simple_Notification_Service)   # The event sends a message to one SNS topic. 
                                    # You have multiple event subscribers to the topic which will be notified.

MQ                                  # Uses open protocols for messaging. When migrating from premises to cloud, 
                                    # MQ replaces RabbitMQ and ActiveMQ.
                                    # Is not serverless and has limited scaling capabilities.