#! /bin/bash

mkdir -p /srv/tiva/{static/do,apps/do}
cp ./build/static/* /srv/tiva/static/do/
cp ./apps/* /srv/tiva/apps/do/
