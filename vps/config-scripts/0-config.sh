#!/bin/bash

scp install.sh $USER@$IP:/home/f0nzy/install.sh

ssh $USER@$IP 'chmod +x install.sh'

ssh $USER@$IP
