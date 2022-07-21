## plone5 buildout


### setup / install

```bash
git clone https://github.com/RBINS/mars.buildout ../mars
virtualenv --python=python2 local/venv
. local/venv/bin/activate
pip install zc.buildout
mkdir -p ../mars/etc/sys;touch ../mars/etc/sys/{settings,settings-prod}.cfg     etc/sys/settings-prod.cfg
pip install -U $(buildout -c buildout.cfg annotate|egrep "(zc.buildout|setuptoo)="|awk '{print $1 "=" $2}')
python2 bootstrap.py --buildout-version=$(buildout -c buildout.cfg annotate|egrep "(zc.buildout|setuptoo)="|awk '{print $2}')
bin/buildout -vvvvNc buildout.cfg 

```

### run

``` bash
./bin/zeoserver-plone5 restart
./bin/instance1-plone5 fg
```

