#!/bin/bash
redis-server --daemonize yes
puma -C config.rb

