#!/bin/bash

[ -e /home/app/tmp/pids/server.pid ] && rm /home/app/tmp/pids/server.pid
rake db:migrate
rails s -b 0 -p 5000
