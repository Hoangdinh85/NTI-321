#!/bin/bash
bash generate_config.sh $1 $2
gcloud compute scp $1.cfg nicolebade@nagios-a:/etc/nagios/servers
# Note: I had to add user nicolebade to group nagios using usermod -a -G nagios nicolebade
# I also had to chmod 775 /etc/nagios/servers
gcloud compute ssh nicolebade@nagios-a --command='sudo /usr/sbin/nagios -v /etc/nagios/nagios.cfg'
