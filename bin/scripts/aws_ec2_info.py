#! /usr/bin/env python3

import boto3


class MyInstance():
    """we cache some of the instance members in our own instance
       structure so we can perform list operations on them"""
    ident = ""
    name = ""
    ip = ""
    ext_ip = ""

    def __init__(self, ident, name, ip, eip):
        self.ident = ident
        self.name = name
        self.ip = ip
        self.ext_ip = eip

    def __str__(self):
        return " ".join([self.ident, self.name, self.ip, self.ext_ip])

def find_name(i):
    """find the instance's name (tag)"""
    try:
        for tag in i.tags:
            if tag['Key'] == 'Name':
                return tag['Value']
    except:
        pass
    return i.private_ip_address


ec2 = boto3.resource('ec2')
ec2_instances = ec2.instances.all()
instances = list()

for i in ec2_instances:
    if i.public_ip_address:
        print "{} {}".format(find_name(i), i.public_ip_address)
