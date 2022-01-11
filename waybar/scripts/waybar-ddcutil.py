#!/usr/bin/env python3

import subprocess
import json

data = {}
#cmd = ["ddcutil", "getvcp", "10", "--bus", "0"]
cmd = ["ddcutil", "getvcp", "10"]
value = subprocess.run(cmd, stdout=subprocess.PIPE).stdout.decode('utf8')
percentage = value.split(":")[1].split(",")[0].split("=")[1].strip(" ")
data['percentage'] = int(percentage)
print(json.dumps(data))
