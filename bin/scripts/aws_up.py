#! /usr/bin/env python3

import boto3
import sys


def find_name(i):
    """find the instance's name (tag)"""
    try:
        for tag in i.tags:
            if tag['Key'] == 'Name':
                return tag['Value']
    except:
        pass
    return i.private_ip_address


def display_instance(i):
    print("instance {} {} ({}) is {}".format(
        i.id, find_name(i), i.private_ip_address, i.state['Name']))


def usage():
    print("""
usage: aws_op.py { start | stop } instance-name-or-id [...]
""".strip())
    sys.exit(2)


def main():
    try:
        op = sys.argv[1]
    except ValueError:
        return usage()
    if op not in ['start', 'stop', 'status']:
        return usage()
    targets = list()
    try:
        targets = sys.argv[2:]
    except ValueError:
        if op != 'status':
            return usage()
        # empty list is okay for status

    ec2 = boto3.resource('ec2')
    ec2_instances = ec2.instances.all()
    instances = list()

    for i in ec2_instances:
        if not targets or i.id in targets or find_name(i) in targets:
            instances.append(i.id)
            if op == 'status':
                display_instance(i)

    if op == 'status':
        return
    elif op == 'start':
        action = ec2.instances.start
    else:
        action = ec2.instances.stop

    for i in instances:
        #r = action(i)
        r = 1
        print("performed {} on {} result {}".format(op, i, r))


if __name__ == '__main__':
    main()
