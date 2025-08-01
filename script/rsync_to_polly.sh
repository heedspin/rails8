#!/usr/bin/env bash                                                                                                                                                  

script_location=$(cd ${0%/*} && pwd -P)
cd "$script_location/.."
rails_root=`pwd`

# Add --dry-run
rsync -va --delete --exclude-from="$rails_root/script/rsync_exclude.txt" "$rails_root/" polly:/var/www/rails8
