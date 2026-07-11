#!/bin/bash
ls -R /tmp &
sleep 10
strace -p $!