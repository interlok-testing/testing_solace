# Solace Testing

[![license](https://img.shields.io/github/license/interlok-testing/testing_solace.svg)](https://github.com/interlok-testing/testing_solace/blob/develop/LICENSE)
[![Actions Status](https://github.com/interlok-testing/testing_solace/actions/workflows/gradle-build.yml/badge.svg)](https://github.com/interlok-testing/testing_solace/actions/workflows/gradle-build.yml)

Project tests interlok-solace features

## What it does

This project contains a single instance of Interlok that will attempt to connect to locally running Solace instance.  It is assumed Solace can be contacted on tcp://localhost:55555.  Once started a single polling trigger will produce a message every 10 seconds and send that message to a queue named "Sample.Q1" on your Solace VPN.  
A second channel will consume the JMS message and it to another queue named "Sample.T1".

There is a further 2 channels, both of which do not start-up by default.  You'll need to log-in to the Interlok UI and start the required channel.

The second channel uses the JCSMP API rather than the standard JMS API, but again will transfer messages from Sample.Q1 to Sample.T1.

The third channel mixes the JMS API for consuming and the JCSMP API for producing.

![solace diagram](/solace.png "solace diagram")
 
## Getting started

* `./gradlew clean build`
* `(cd ./build/distribution && java -jar lib/interlok-boot.jar)`

## Notes
The Interlok UI starts up on port 8082, so as not to clash with any locally hosted Solace instance running it's UI on port 8080.

### docker

You can run solace inside docker, it'll look something like this 

```
  local IMAGE="solace/solace-pubsub-standard:latest"
  docker pull $IMAGE
  docker run -it --rm -p 127.0.0.1:55555:55555 -e username_admin_globalaccesslevel=admin -e username_admin_password=admin \
         -e system_scaling_maxconnectioncount=100 --shm-size=1g --ulimit nofile=2448:38048 --ulimit core=1 \
         -h solace.local "$IMAGE"
```