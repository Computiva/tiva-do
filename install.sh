#! /bin/bash

mkdir -p /srv/tiva/{static/do/fonts,apps/do}
cp ./build/static/* /srv/tiva/static/do/
cp -R ./static/* /srv/tiva/static/do/
cp ./apps/* /srv/tiva/apps/do/
