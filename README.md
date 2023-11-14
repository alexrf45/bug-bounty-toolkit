# bug-bounty-toolkit
Bug Bounty made a little easier


Wanna spin up a vps for bug bounty? This repo has you covered!!


## VPS:

*ensure you have installed terraform, aws cli and configured AWS credentials before running the module*

1. Spin up the vps and export environment variables of the IP of the EC2 instance($IP)and Username set in your main.tf ($USER) once it's up and running

2. In the root directory, run the following command `chmod +x config.sh && ./config.sh`

3. This script will ssh into the vps from which the post-installation script can be run

4. In the vps run `./install.sh`

5. after the installation is done you can run the following command to enter the container and get to hacking!!

`bounty <CONTAINER_NAME>`


