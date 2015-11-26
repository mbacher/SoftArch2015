#!/usr/bin/env bash
wget http://kti.tugraz.at/staff/rkern/courses/sa/data/austria-latest.osm.bz2
wget http://kti.tugraz.at/staff/rkern/courses/sa/data/Graz.poly
wget http://kti.tugraz.at/staff/rkern/courses/sa/data/routes.csv
wget http://kti.tugraz.at/staff/rkern/courses/sa/data/mapping.csv

#bunzip2 austria-latest.osm.bz2

mysql < setup_db_user.sql

wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o osmconvert
wget -O - http://m.m.i24.cc/osmfilter.c | cc -x c - -O3 -o osmfilter

./pipeline_1.sh
./pipeline_2.sh
./setup_routes.sh


