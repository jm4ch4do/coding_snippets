"------------------------BASIC-------------------------"
# create and increase replicas (this process can be also done automatically)
kubect run --replicas=1000 my-web-server
kubect scale --replicas=2000 my-web-server