#!/bin/sh

# Written by Paul Cockshott, modified by Victoria Mermel
  
 set -x
 java planning.nyearplan  ../toy/flows.csv  ../toy/cap.csv  ../toy/dep.csv  ../toy/labtarg.csv > /tmp/model.lp
 
wc /tmp/model.lp
 
time lp_solve </tmp/model.lp | sort | sed "/Actual/d" | tee plan.txt
