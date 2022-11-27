 
  
 set -x
 java planning.nyearplan  flows.csv  cap.csv  dep.csv  labtarg.csv > /tmp/test.lp
 
wc /tmp/test.lp
 
time lp_solve </tmp/test.lp | sort | sed "/Actual/d" | tee results.txt
