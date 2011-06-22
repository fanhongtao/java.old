#!/bin/bash
# Push git repositories to the server.

# check args
if [ $# -ne 2 -a $# -ne 3 ]; then
    echo "Usage: $0  project-file-list  remote-name  [ branch-name ]"
    exit 1
fi

base_dir=`pwd`
remote_name=$2
if [ $# -ne 3 ]; then
    branch_name=$3
else
    branch_name="master"
fi

while read line
do
    echo $line
    repo_dir=${base_dir}/${line}

    cd ${repo_dir}
    if [ $? -ne 0 ]; then
        echo "Can't entry directory [${repo_dir}]."
        continue
    fi    

    git push ${remote_name}  ${branch_name}
done < $1
