## mongod.sh
## gsn - Aug 11, 2016
## this works for Centos 6 distrubutions, as they use yum. Should be changed to dnf for more recent Centos distributions.
if [$cat /etc/redhat-release |awk '{print $3}'|cut -b1) -gt 6 ];then
   echo not implemented for dnf
   exit
fi

yum list |grep mongo
if [ $? -ne 0 ];then
  cd /etc/yum.repos.d
  echo
  for i in *.repo
  do
      sed -i "s:enabled=0:enabled=1:g" $i
  done
  cat >mongodb-org-3.2.repo <<!
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/
gpgcheck=0
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc
!
fi
sudo yum install -y mongodb-org
service mongod status
[ $? -ne 0 ] && service mongod start
chkconfig mongod on
