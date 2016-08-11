## Flask.sh
## author - gsn : Aug 11,2016

mkdir -p /var/www/Flask
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
mkdir app
cd app
#### To be done endpoints configuration
cat >Flask.py <<!
from flask import Flask, render_template
App = Flask(__name__)
@App.route("/")
if __name__ == "__main__":
      App.run (host='127.0.0.1', port=8080)
!
python3.4 Flask.py
