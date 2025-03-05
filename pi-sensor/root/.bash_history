cd 
apt-get -y install openssh-server netconfd yangcli
cat >>/etc/ssh/sshd_config<<EOF
Port 830
Subsystem netconf /usr/sbin/netconf-subsystem
EOF

/etc/init.d/ssh restart
sudo netconfd --module=helloworld --no-startup --superuser=pi
nano /etc/rc.local
chmod uxo+x /etc/rc.local
chmod ugo+x /etc/rc.local
reboot
cd
yangcli --server=10.13.37.162 --user=pi --password=kristianiapraksis
ls
exit

