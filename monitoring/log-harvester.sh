# Authour Damcorp
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

# add your array host address ex. 192.168.x.1 192.168.x.2 192.168.x.3 separate each address with space !
HOSTS=(192.168.x.1 192.168.x.1 192.168.x.2 192.168.x.3)

# ssh to each coreapp/master/webapp host, execute command to collect coreapp logs on the host 
# make sure host who run this script can enstablish ssh connection to all your coreapp/master/webapp hosts
# change username, logname, --since value, --util value, local path, containername
for host in ${HOSTS[@]}; do
    echo "SSH TO $host";
    ssh username@$host $cmd "docker logs containername --since=2020-03-20T17:40:00 --until=2020-03-20T18:40:00 >> $host.logname.log"
    echo "SCP FILE FROM $host";
    scp username@$host:~/$host.logname.log ~/local/path/
done