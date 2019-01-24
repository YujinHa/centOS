#!/usr/bin/env python
import sys
import os

a = ['','/shot','/in','/out','/edit','/asset','/asset/char','/asset/shader','/config','/config/ocio','/config/thumbnail','/doc','/doc/concept']
for i in a:
	os.makedirs("/project/%s%s" %(sys.argv[1],i))
