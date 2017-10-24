#! /usr/bin/env python

import boto3
import os
import paramiko
import socket
import sys
import traceback
from multiprocessing import Pool
from paramiko_expect import SSHClientInteraction


key_files = {
    't0ops': 't0ops-t0.pem',
    'jenkins_rsa': 'jenkins_rsa',
    }
pkeys = dict()

the_file = ''


class MyInstance():
    """we cache some of the instance members in our own instance
       structure so we can perform list operations on them"""
    ident = ""
    name = ""
    ip = ""
    key = None

    def __init__(self, ident, name, ip, key):
        self.ident = ident
        self.name = name
        self.ip = ip
        self.key = key

    def __str__(self):
        return " ".join([self.ident, self.name, self.ip, self.key])


def load_key(name):
    """load an SSH key file for use in paramiko"""
    pkey_filename = os.path.join(os.getenv('HOME'), '.ssh', key_files[name])
    pkey = paramiko.RSAKey.from_private_key_file(pkey_filename)
    pkeys[name] = pkey


def find_name(i):
    """find the instance's name (tag)"""
    try:
        for tag in i.tags:
            if tag['Key'] == 'Name':
                return tag['Value']
    except:
        pass
    return i.private_ip_address


def load_instances():
    """suck in all of the AWS EC2 instances that we have keys for"""
    ec2 = boto3.resource('ec2')
    ec2_instances = ec2.instances.all()
    instances = list()
    not_running = 0
    no_key = 0

    for i in ec2_instances:
        if i.key_pair:
            n = i.key_pair.name
            if n in pkeys:
                if i.state['Name'] == 'running':
                    mi = MyInstance(i.id, find_name(i), i.private_ip_address, n)
                    instances.append(mi)
                else:
                    not_running += 1
            else:
                no_key += 1
        else:
            no_key += 1

    print "{} instances not running".format(not_running)
    print "{} instances without valid keypair".format(no_key)
    return instances


def process_func(i):
    """this is a separate function so we can catch exceptions that
       paramiko doesn't handle very well"""
    try:
        doit(i)
    except Exception:
        print "Exception in worker:"
        traceback.print_exc()
        raise


def doit(i):
    global the_file

    sys.stdout.write(".")
    sys.stdout.flush()
    try:
        pkey = pkeys[i.key]
        c = paramiko.SSHClient()
        c.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        try:
            c.connect(i.ip, username='ubuntu', pkey=pkey)
        except paramiko.ssh_exception.PasswordRequiredException:
            # try ec2-user
            c.connect(i.ip, username='ec2-user', pkey=pkey)
    except Exception, e:
        print "error connecting to {} ({}): {}".format(i.name, i.ip, e)
        return
    try:
        f = c.open_sftp()
        try:
            os.mkdir(str(i.ip))
        except OSError:                   # directory already exists?
            pass
        print "about to get {} to {}".format(
            the_file, os.path.join(str(i.ip), os.path.basename(the_file)))
        f.get(the_file, os.path.join(str(i.ip), os.path.basename(the_file)))
        f.close()
    except socket.timeout, e:
        print "timeout waiting for response from {} ({})".format(i.name, i.ip)
        interact.close()
    c.close()


def main():
    global the_file

    for key in key_files.keys():
        load_key(key)

    instances = load_instances()

    the_file = sys.argv[1]
    print "ready to process {} instances".format(len(instances))
    print "retrieving command: {}".format(the_file)

    pool = Pool(20)
    pool.map(process_func, instances, 1)
    pool.close()
    pool.join()
    print ""


if __name__ == '__main__':
    main()
