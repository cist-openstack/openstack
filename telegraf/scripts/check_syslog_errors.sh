#!/bin/bash
errors=`tail -1000 /var/log/messages | grep -v syslog_errors | grep -i err | wc -l`
echo "{\"syslog_errors\": $errors}"
