#! /usr/bin/env python

import boto3
import sys


def find_tag(i, t):
    """find the instance's specified tag for the given instance"""
    try:
        for tag in i.tags:
            if tag['Key'] == t:
                return tag['Value']
    except:
        pass
    return None


ec2 = boto3.resource('ec2')
instances = ec2.instances.filter(
    Filters=[{'Name': 'private-ip-address', 'Values': sys.argv[1:]}])

for i in instances:
    instance_name = find_tag(i, "Name")
    if instance_name is None:
        instance_name = i.private_ip_address
    print("{} [{}] {}".format(instance_name, i.private_ip_address, i.instance_id))
