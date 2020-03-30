#!/usr/bin/env sh

INTERFACES="2;1,unifi-ap.bx.home,wifi0;2,unifi-ap-ac-lite.bx.home,wifi0,wifi1"

hosts_amount="$(echo $INTERFACES | cut -d';' -f1)"

h=2
while [ $h -le `expr $hosts_amount + 1` ]
do
    host_str="$(echo $INTERFACES | cut -d';' -f$h)"

    if_amount="$(echo $host_str | cut -d',' -f1)"

    host="$(echo $host_str | cut -d',' -f2)"

    i=3
    while [ $i -le `expr $if_amount + 2` ]
    do
        echo $host
        interface=$(echo $host_str | cut -d',' -f$i)

        echo "ssh -i ~/.ssh/id_rsa -o StrictHostKeyChecking=accept-new -l $SSH_USER $host ifconfig $interface"

        i=`expr $i + 1`
    done

    echo ""

   h=`expr $h + 1`
done
read -p "Press [Enter] key to start backup..."
