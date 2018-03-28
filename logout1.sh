#!/bin/bash
# --------------------------------------
# auto logout for wg.suda.edu.cn
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

username=""
password=""
url=http://wg.suda.edu.cn/indexn.aspx
html=$(curl $url)

s=${html#*value=\"}
VIEWSTATE=${s%%\"*}
s=${s#*value=\"}
EVENTVALIDATION=${s%%\"*}

VIEWSTATE=$(urlencode $VIEWSTATE)
EVENTVALIDATION=$(urlencode $EVENTVALIDATION)

#logout
html=$(curl $url -H 'Content-Type: application/x-www-form-urlencoded' --data "__EVENTTARGET=&__EVENTARGUMENT=&__VIEWSTATE=""$VIEWSTATE""&__EVENTVALIDATION=""$EVENTVALIDATION""&TextBox1=""$username""&TextBox2=""$password""&nw=RadioButton2&tm=RadioButton8&Button4=%e9%80%80%e5%87%ba%e7%bd%91%e5%85%b3")

#echo $html
