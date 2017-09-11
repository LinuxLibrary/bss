#!/bin/bash

of=/misc/backup-$(date +%y%m%d).tar
tar -czf $of /home
