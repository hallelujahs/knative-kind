#!/usr/bin/env bash

set -eo pipefail

echo -e "🍿 Installing Knative Serving and Eventing ... \033[0m"
STARTTIME=$(date +%s)
./install.sh
echo -e "🕹 Installing Knative Samples Apps... \033[0m"
./03-serving-samples.sh
./05-eventing-samples.sh
DURATION=$(($(date +%s) - $STARTTIME))
echo "kubectl get ksvc,broker,trigger"
kubectl -n default get ksvc,broker,trigger
echo -e "\033[0;92m 🚀 Knative install with samples took: $(($DURATION / 60))m$(($DURATION % 60))s \033[0m"
echo -e "\033[0;92m 🎉 Now have some fun with Serverless and Event Driven Apps \033[0m"