echo "Adding wheel" > /root/post-run.log
usermod -aG wheel rhel

echo "setting password" >> /root/post-run.log
echo redhat | passwd --stdin rhel

echo "adding cockpit" >> /root/post-run.log
yum -y install cockpit cockpit-packagekit

echo "starting cockpit" >> /root/post-run.log
systemctl start cockpit

echo "DONE" >> /root/post-run.log

curl -o /root/install_sql.sh https://raw.githubusercontent.com/rhel-labs/learn-katacoda/master/sql-server-crypto-policy/install_sql.sh 
sudo chmod +x ./install_sql.sh
sudo ./install_sql.sh
export HOSTNAME=`hostname --all-fqdns`
