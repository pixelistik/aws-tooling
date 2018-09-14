## Goal

Increase the size of an EBS volume for a host at runtime, if needed.

## How to

Create test instance

    $ terraform init
    $ terraform apply
    
Increase the EBS volume size

    $ aws ec2 modify-volume --region eu-west-1 --volume-id vol-<volume ID> --size 10
    
Increase the partition size inside the host

    $ ssh ubuntu@<dns domain name>
    $ # on the host:
    $ sudo growpart /dev/xvda 1

## Learnings

Elastic EBS volumes can be resized once every 6 hours.
The size can only be increased, not decreased.

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modify-volume.html

The `growpart` command does nothing if there is no space to grow the partition,
it can safely be run regularly, just in order to check for a possible
increase.

`growpart` is a wrapper script around `sfdisk` and other tools, providing
some safeguards and rollbacks in case of a problem.