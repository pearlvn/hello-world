## Flask.sh
## author - gsn : Aug 11,2016
## this works for Centos 6 distrubutions, as they use yum. Should be changed to dnf for more recent Centos distributions.
if [$cat /etc/redhat-release |awk '{print $3}'|cut -b1) -gt 6 ];then
   echo not implemented for dnf
   exit
fi

mkdir -p /var/www/Flask
cd /etc/yum.repos.d
for i in *.repo
do
   sed -i "s/enabled=0/enabled=1/g" $i
done
cd /var/www/Flask
yum groupinstall 'Development Tools'
yum install -y zlib-devel openssl-devel sqlite-devel bzip2-devel
yum install wget
wget https://www.python.org/ftp/python/3.4.2/Python-3.4.2.tgz
tar xzvf Python-3.4.2.tgz
cd Python-3.4.2
./configure
make
make altinstall
pip3.4 install pyvenv-3.4
pyvenv-3.4 venv
. venv/bin/activate
pip3.4 install flask
pip3.4 install pymongo
mkdir app
cd app
#### To be done endpoints configuration
cat >Flask.py < from flask import Flask, render_template, request
fluser = Flask(__name__)

@fluser.route("/")


def hello():
if request.method == 'POST':
# update_mongoDB ### code needs to be added , of following form - TBD
if valid_login(request.form['uid'],request.form['username'],
request.form['md5checksum']):
return update_mongoDB(request.form)
else:
error = 'Invalid user/md5check'

if request.method == 'GET':
# query_mongoDB ### code needs to be added , of following form - TBD
if valid_login(request.form['uid'],request.form['username'],
request.form['md5checksum']):
return query_mongoDB(request.form)
return (uid,date,number of occurrences)
else:
error = 'Invalid user/md5check'

!

nohup python3.4 Flask.py &
