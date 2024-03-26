#!/usr/bin/sh


# /etc/hosts
# 
# ...
# ...
# #BLOCKED
#  #*127.0.0.1 twitter.com
#
#
#

if are not blocked then
  sed -i "%s/#*/ /" /etc/hosts
else
  sed -i 
  


#flush caches
resolvectl flus-caches
