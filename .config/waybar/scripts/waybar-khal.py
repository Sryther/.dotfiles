#!/usr/bin/env python

import subprocess
import datetime
import json
from html import escape

data = {}

today = datetime.date.today().strftime("%d/%m/%Y")
tomorrow = (datetime.date.today() + datetime.timedelta(days=1)).strftime("%d/%m/%Y")
next_week = (datetime.date.today() +  datetime.timedelta(days=10)).strftime("%d/%m/%Y")

output = subprocess.check_output("khal list --format \"{start-date} {start-time} > {end-time} - {title}\" now %s" % next_week, shell=True)
output = output.decode("utf-8")
outputToday = subprocess.check_output("khal list --format \"{title}\" now %s" % tomorrow, shell=True)
outputToday = outputToday.decode("utf-8")
nbToday = len(outputToday.split("\n")) - 2 if len(outputToday.split("\n")) > 0 else 0
lines = output.split("\n")
new_lines = []
for line in lines:
    clean_line = escape(line).split(" ::")[0]
    if len(clean_line) and not clean_line[0] in ['0', '1', '2']:
        clean_line = "\n<b>%s</b>" % clean_line
    new_lines.append(clean_line)
output = "\n".join(new_lines).strip()

if today in output:
    data['text'] = " %s" % str(nbToday)
else:
    data['text'] = ""

data['tooltip'] = output

print(json.dumps(data))
