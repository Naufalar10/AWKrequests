#!/bin/bash

mkdir forensic_log_website_daffainfo_log

awk -F: '/Jan/ { ++n } END{print "Rata-rata serangan adalah sebanyak", n/12, "request per jam"}' log_website_daffainfo.log > ratarata.txt

awk -F: '{a[$1]++}END{for(i in a){print"IP yang paling banyak mengakses server adalah:", i, "sebanyak", a[i], "requests"}}' log_website_daffainfo.log | sort -k 10rn | head -1 > result.txt

awk -F: '/curl/ { ++n } END{print "Ada", n, "request yang menggunakan curl sebagai user-agent"}' log_website_daffainfo.log >> result.txt

awk -F: '{if($3==02) {print $1,"jam 2 pagi"}}' log_website_daffainfo.log >> result.txt

