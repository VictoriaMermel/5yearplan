#/bin/sh

# Written by Paul Cockshott, modified by Victoria Mermel

java planning.testeconomy $1 $2
 
java planning.nyearplan testflow.csv testcap.csv testdep.csv testtarg.csv > /tmp/model.lp
 
echo sectors $1 years $2
wc /tmp/model.lp  
 
time lp_solve < /tmp/model.lp | sort | sed "/Actual/d" > plan.txt

rm testflow.csv testcap.csv testdep.csv testtarg.csv
