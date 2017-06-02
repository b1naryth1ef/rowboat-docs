#!/bin/sh

mdbook build

rsync -avzP book/* root@zek.hydr0.com:/var/www/rowboat-docs/
