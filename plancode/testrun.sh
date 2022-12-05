#/bin/sh

# Written by Paul Cockshott, modified by Victoria Mermel

java planning.testeconomy $1 $2
 
java planning.nyearplan testflow.csv testcap.csv testdep.csv testtarg.csv > /tmp/model.lp
 
echo sectors $1 years $2
echo lines, words, chars
wc /tmp/model.lp  

rm testflow.csv testcap.csv testdep.csv testtarg.csv
echo execute and time  the linear programme
echo 'time lp_solve < /tmp/model.lp | sort | sed "/Actual/d/" > plan.txt'
time lp_solve < /tmp/model.lp | sort | sed "/Actual/d" > plan.txt

echo Degree of plan fulfillment using linear programme
tail --lines=2 plan.txt
