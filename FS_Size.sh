#!/bin/bash
#
##############################################
#### This script checks the usage of /var ####
#### if usage is more than 80% then sends ####
#### mail to users. ##########################
##############################################
#
EMAILS="abc@test.com,xyz@test.com"
FULL_LINE=`df -h /var | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' |grep -v mapper |awk '{print $1 "   " $2}' |grep -iv mount`
#
TEMP_FILE="`echo $HOME`/temp.out"
echo "$FULL_LINE" > $TEMP_FILE
#
DF=`/bin/df -h`
USAGE=`df -h /var | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' |grep -v mapper |awk '{print $1 "   " $2}' |grep -iv mount |awk '{print $2}'`
#
i=`df -h /var | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' |grep -v mapper |awk '{print $1 "   " $2}' |grep -iv mount |awk '{print $2}' | tr -d '%'` 
#
FS=`df -h /var | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' |grep -v mapper |awk '{print $1 "   " $2}' |grep -iv mount |awk '{print $1}'`
#
if [ $i -ge 80 ]
then
/bin/mail -s "FS Alert `uname -n` ---- $FS has reached $USAGE" $EMAILS < $TEMP_FILE
fi
rm -rf $TEMP_FILE
