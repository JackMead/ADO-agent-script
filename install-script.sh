#!/bin/sh

mkdir /agent && cd /agent

wget https://vstsagentpackage.azureedge.net/agent/3.243.0/vsts-agent-linux-x64-3.243.0.tar.gz

tar zxvf vsts-agent-linux-x64-3.243.0.tar.gz
echo "Reached here"
/agent/config.sh --unattended --url $1 --auth pat --token $2 --pool default --agent myAgent --acceptTeeEula --work /agent
echo "Command complete"
echo $1 $2
sudo /agent/svc.sh install
sudo /agent/svc.sh start