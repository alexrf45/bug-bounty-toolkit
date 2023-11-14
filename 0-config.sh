#!/bin/bash

scp install.sh $USER@$IP:$HOME/install.sh

ssh $USER@$IP 'chmod +x install.sh'

ssh $USER@$IP
