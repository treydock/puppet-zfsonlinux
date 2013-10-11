#!/usr/bin/env python

import sys
import time
import copy
import re
from decimal import Decimal
from pprint import pprint

not_calculated = ["arcsz","c","l2size"]
l2exist = False
kstat = None
cur = {}
d = {}

stat = sys.argv[1]

def kstat_update():
  global kstat

  k = [line.strip() for line in open('/proc/spl/kstat/zfs/arcstats')]

  if not k:
    sys.exit(1)

  del k[0:2]
  kstat = {}

  for s in k:
    if not s:
      continue

    name, unused, value = s.split()
    kstat[name] = Decimal(value)

def snap_stats():
    global cur
    global kstat

    prev = copy.deepcopy(cur)
    kstat_update()

    cur = kstat
    for key in cur:
        if re.match(key, "class"):
            continue
        if key in prev:
            d[key] = cur[key] - prev[key]
        else:
            d[key] = cur[key]

def calculate():
    global d
    global v
    global l2exist

    v = {}
    v["hits"] = d["hits"]
    v["miss"] = d["misses"]
    v["read"] = v["hits"] + v["miss"]
    v["hit%"] = 100 * v["hits"] / v["read"] if v["read"] > 0 else 0
    v["miss%"] = 100 - v["hit%"] if v["read"] > 0 else 0

    v["dhit"] = d["demand_data_hits"] + d["demand_metadata_hits"]
    v["dmis"] = d["demand_data_misses"] + d["demand_metadata_misses"]

    v["dread"] = v["dhit"] + v["dmis"]
    v["dh%"] = 100 * v["dhit"] / v["dread"] if v["dread"] > 0 else 0
    v["dm%"] = 100 - v["dh%"] if v["dread"] > 0 else 0

    v["phit"] = d["prefetch_data_hits"] + d["prefetch_metadata_hits"]
    v["pmis"] = d["prefetch_data_misses"] + d["prefetch_metadata_misses"]

    v["pread"] = v["phit"] + v["pmis"]
    v["ph%"] = 100 * v["phit"] / v["pread"] if v["pread"] > 0 else 0
    v["pm%"] = 100 - v["ph%"] if v["pread"] > 0 else 0

    v["mhit"] = d["prefetch_metadata_hits"] + d["demand_metadata_hits"]
    v["mmis"] = d["prefetch_metadata_misses"] + d["demand_metadata_misses"]

    v["mread"] = v["mhit"] + v["mmis"]
    v["mh%"] = 100 * v["mhit"] / v["mread"] if v["mread"] > 0 else 0
    v["mm%"] = 100 - v["mh%"] if v["mread"] > 0 else 0

    v["arcsz"] = cur["size"]
    v["c"] = cur["c"]
    v["mfu"] = d["mfu_hits"]
    v["mru"] = d["mru_hits"]
    v["mrug"] = d["mru_ghost_hits"]
    v["mfug"] = d["mfu_ghost_hits"]
    v["eskip"] = d["evict_skip"]
    v["rmis"] = d["recycle_miss"]
    v["mtxmis"] = d["mutex_miss"]

    if l2exist:
        v["l2hits"] = d["l2_hits"]
        v["l2miss"] = d["l2_misses"]
        v["l2read"] = v["l2hits"] + v["l2miss"]
        v["l2hit%"] = 100 * v["l2hits"] / v["l2read"] if v["l2read"] > 0 else 0

        v["l2miss%"] = 100 - v["l2hit%"] if v["l2read"] > 0 else 0
        v["l2size"] = cur["l2_size"]
        v["l2bytes"] = d["l2_read_bytes"]


def main():
  global l2exist

  snap_stats()

  l2_size = cur.get("l2_size")
  if l2_size:
    l2exist = True

  if not stat in not_calculated:
      time.sleep(1)

  snap_stats()
  calculate()

  out = v.get(stat)
  if not out:
    sys.exit(1)
  else:
    sys.stdout.write("%s\n" % '{0:.0f}'.format(out))


if __name__ == '__main__':
  main()
