#/bin/sh

# Written by Paul Cockshott, modified by Victoria Mermel

java planning.testeconomy $1 $2
echo  execute and time   the harmony algorithm
echo "time java -Xmx1512m planning.nyearHarmony testflow.csv testcap.csv testdep.csv testtarg.csv > harmony.txt"

time java -Xmx1512m planning.nyearHarmony testflow.csv testcap.csv testdep.csv testtarg.csv > harmony.txt
 
echo Harmony achieved 
tail --lines=2 harmony.txt
echo   prepare the linear programme and print time taken
 
time  java planning.nyearplan testflow.csv testcap.csv testdep.csv testtarg.csv > /tmp/model.lp
 
echo statistics of the linear programme specification
echo lines, words, chars
wc /tmp/model.lp  
echo execute and time  the linear programme
echo 'time lp_solve < /tmp/model.lp | sort | sed "/Actual/d/" > plan.txt'
time lp_solve < /tmp/model.lp | sort | sed "/Actual/d" > plan.txt
 
echo Degree of plan fulfillment using linear programme
tail --lines=2 plan.txt 

rm testcap.csv testdep.csv testflow.csv testtarg.csv
