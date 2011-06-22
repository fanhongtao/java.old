#!/bin/bash
# Pull git repositories to the local.

# check args
if [ $# -lt 1 ]; then
    echo "Usage: $0  project-file-list  [ remote-name  [ branch-name ] ]"
    echo "Example:"
    echo "    $0  project.list"
    echo "    $0  project.list  origin"
    echo "    $0  project.list  origin  master"
    exit 1
fi

base_dir=`pwd`
remote_name=""
branch_name=""
if [ $# -lt 1 ]; then
    remote_name=$2
    if [ $# -lt 2 ]; then
        branch_name=$3
    fi
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

    git pull ${remote_name}  ${branch_name}
done < $1
