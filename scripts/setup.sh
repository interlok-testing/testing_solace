#!/bin/sh
curl -X POST -H 'Content-Type: application/json' -u admin:admin solace-1:8080/SEMP/v2/config/msgVpns/default/queues -d '{ "queueName":"Sample.Q1",
                                                                                                                "accessType":"exclusive",
                                                                                                                "maxMsgSpoolUsage":200,
                                                                                                                "permission":"modify-topic",
                                                                                                                "ingressEnabled":true,
                                                                                                                "egressEnabled" :true  }'
curl -X POST -H 'Content-Type: application/json' -u admin:admin solace-1:8080/SEMP/v2/config/msgVpns/default/topicEndpoints -d ' { "topicEndpointName":"Sample.T1",
                                                                                                                        "accessType":"exclusive",
                                                                                                                        "permission":"modify-topic",
                                                                                                                        "ingressEnabled":true,
                                                                                                                        "egressEnabled" :true  }'