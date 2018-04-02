#!/bin/bash
# --------------------------------------
# auto logout for a.suda.edu.cn
# ---------------------------------------

logout_url=http://a.suda.edu.cn/index.php/index/logout

#logout
html=$(curl $logout_url)

#echo $html
