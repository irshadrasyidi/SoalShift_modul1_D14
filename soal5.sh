#!/bin/bash

#awk '{print}' /var/log/syslog
#awk '(/CRON/ || /cron/),!/sudo/' /var/log/syslog

awk '(/CRON/ || /cron/),!/sudo/' /var/log/syslog | awk 'NF < 13' >> /home/irshadrasyidi/modul1/no5.txt
