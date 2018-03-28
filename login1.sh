#!/bin/bash
# --------------------------------------
# auto login for wg.suda.edu.cn
# ---------------------------------------

function urlencode()
{
 s="$1"
 tmp=''
 for (( i = 0 ; i < ${#s} ; i++ ))
 do
 ch=${s:$i:1}
 case "$ch"
 in [a-zA-Z0-9]) tmp="$tmp""$ch";;
 * ) tmp="$tmp""%""$(printf "%x" \'$ch)"
 esac
 done
 echo $tmp;
}

# read username
if [ $# -ge 1 ]; then
    username=$1
else
    echo -n "please input username: "
    read username
fi
# read password
if [ $# -ge 2 ]; then
    password=$2
else
    echo -n "please input password: "
    read -s password
fi

url=http://wg.suda.edu.cn/indexn.aspx
html=$(curl $url)

s=${html#*value=\"}
VIEWSTATE=${s%%\"*}
s=${s#*value=\"}
EVENTVALIDATION=${s%%\"*}

VIEWSTATE=$(urlencode $VIEWSTATE)
EVENTVALIDATION=$(urlencode $EVENTVALIDATION)

#login
html=$(curl $url -H 'Content-Type: application/x-www-form-urlencoded' --data "__EVENTTARGET=&__EVENTARGUMENT=&__VIEWSTATE=""$VIEWSTATE""&__EVENTVALIDATION=""$EVENTVALIDATION""&TextBox1=""$username""&TextBox2=""$password""&nw=RadioButton2&tm=RadioButton8&Button1=%e7%99%bb%e5%bd%95%e7%bd%91%e5%85%b3")

#echo $html
