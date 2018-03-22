#!/bin/bash

# Configure the oc environment
eval $(minishift oc-env)

# Configure the docker environment
eval $(minishift docker-env)
