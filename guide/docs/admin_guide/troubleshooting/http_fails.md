### HTTPD fails to restart due to missing php file 'lib5php.sp'

```
[root@controller conf]# systemctl status -l httpd
? httpd.service - The Apache HTTP Server
Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; vendor preset: disabled)
Active: failed (Result: exit-code) since Sat 2016-10-29 10:54:04 EDT; 13s ago
Docs: man:httpd(8)
man:apachectl(8)
Process: 17536 ExecStop=/bin/kill -WINCH ${MAINPID} (code=exited, status=1/FAILURE)
Process: 17534 ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND (code=exited, status=1/FAILURE)
Main PID: 17534 (code=exited, status=1/FAILURE)
Oct 29 10:54:04 controller.cist.pitt.edu systemd[1]: Starting The Apache HTTP Server...
Oct 29 10:54:04 controller.cist.pitt.edu httpd[17534]: httpd: Syntax error on line 38 of /etc/httpd/conf/httpd.conf: Syntax error on line 1 of /etc/httpd/conf.modules.d/php5.load: Cannot load modules/libphp5.so into server: /etc/httpd/modules/libphp5.so: cannot open shared object file: No such file or directory
Oct 29 10:54:04 controller.cist.pitt.edu systemd[1]: httpd.service: main process exited, code=exited, status=1/FAILURE
Oct 29 10:54:04 controller.cist.pitt.edu kill[17536]: kill: cannot find process ""
Oct 29 10:54:04 controller.cist.pitt.edu systemd[1]: httpd.service: control process exited, code=exited status=1
Oct 29 10:54:04 controller.cist.pitt.edu systemd[1]: Failed to start The Apache HTTP Server.
Oct 29 10:54:04 controller.cist.pitt.edu systemd[1]: Unit httpd.service entered failed state.
Oct 29 10:54:04 controller.cist.pitt.edu systemd[1]: httpd.service failed.
```

Solution:  
Install PHP.  
`$ yum install php`
