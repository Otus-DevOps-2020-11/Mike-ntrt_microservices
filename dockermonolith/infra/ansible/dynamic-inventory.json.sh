#!/bin/bash

yc_instances=($(yc compute instance list | grep docker | awk -F\| '{print $3 $6}'))

if [[ "$1" == "--list" ]]; then
#heredoc
cat<<EOF
{
    "_meta": {
        "hostvars": {
            "${yc_instances[0]}": {
                "ansible_host": "${yc_instances[1]}",
                "ansible_user": "ubuntu"
            },
            "${yc_instances[2]}": {
                "ansible_host": "${yc_instances[3]}",
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "docker",
            "ungrouped"
        ]
    },
    "docker": {
        "hosts": [
            "${yc_instances[0]}",
            "${yc_instances[2]}"
        ]
    }
}
EOF

elif [[ "$1" == "--host" ]]; then
cat<<EOF
{
    "_meta": {
        "hostvars": {}
    }
}
EOF
else
  echo "no args"
fi
