#!/usr/bin/python

import requests
import time

url_prefix = 'http://xxx'

for p in ['aaa', 'bb', 'cc']:
  t0 = time.time()
  r = requests.get(url_prefix + p, auth=('username', r'password'))
  t1 = time.time()
  print(p, r.status_code, t1-t0)
  
