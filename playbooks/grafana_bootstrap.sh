#!/bin/bash
ansible-playbook all git_pull.yaml
ansible-playbook all telegraf.yaml
