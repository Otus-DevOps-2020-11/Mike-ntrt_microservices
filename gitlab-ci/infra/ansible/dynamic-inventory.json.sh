#!/bin/bash

yc_instances=($(yc compute instance list | grep gitlab| awk -F\| '{print $3 $6}'))

if [[ "$1" == "--list" ]]; then
#heredoc
cat<<EOF
{
    "_meta": {
        "hostvars": {
            "${yc_instances[0]}": {
                "ansible_host": "${yc_instances[1]}",
                "ansible_user": "ubuntu"
            }
        }
    },
    "all": {
        "children": [
            "gitlab",
            "ungrouped"
        ]
    },
    "gitlab": {
        "hosts": [
            "${yc_instances[0]}"
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
