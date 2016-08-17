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
  for i in *.repo
  do
      sed -i "s/enabled=0/enabled=1/g" $i 
  done
  echo
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

mongo <!
use catalyst
db.createCollection("catalystDocs")
show collections
db.catalystDocs.insert([
{
title: 'John Doe Doc',
description: 'John Doe Doc',
uid: '1',
date: '2016-08-11T07:46:36.611Z',
md5checksum: 'c2ac68f271d7053ad1416cdccdbc5776',
url: 'http://localhost:8080/JohnDoeDoc',
usraccessCount: '0'
},
{
title: 'Jane Doe Doc',
description: 'Jane Doe Doc',
uid: '1',
date: '2016-08-11T18:46:36.611Z',
md5checksum: '0368c3bf935bbade67e13f733c42fdb9',
url: 'http://localhost:8080/JaneDoeDoc',
usraccessCount: '0'
}
])
!
