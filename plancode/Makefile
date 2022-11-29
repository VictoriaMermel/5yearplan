all:   planning/nyearplan.class harmony.txt plan.txt example_model.lp
	lp_solve < example_model.lp | sort | sed "/Actual/d"

plan.txt: planning/nyearplan.class planning/testeconomy.class testrun.sh
	bash testrun.sh 4 2

harmony.txt: planning/nyearplan.class planning/testeconomy.class testharmony.sh planning/nyearHarmony.class testharmony.sh Makefile
	bash testharmony.sh 3 3

pasharm/harmonyplan:  pasharm/harmonyplan.pas pasharm/csvfilereader.pas pasharm/technologies.pas pasharm/harmony.pas
	$(MAKE) -C pasharm

planning/csvfilereader.class: planning/csvfilereader.java planning/pcsv.java
	javac planning/csvfilereader.java

clean:
	rm planning/*.class  
	rm plan.txt
	rm /tmp/model.lp
	rm /tmp/harmony.txt
	rm example_model.lp

planning/nyearplan.class:planning/nyearplan.java planning/csvfilereader.class
	javac planning/nyearplan.java

example_model.lp:planning/nyearplan.class ../toy/flows.csv ../toy/cap.csv ../toy/dep.csv ../toy/labtarg.csv Makefile
	java planning.nyearplan ../toy/flows.csv ../toy/cap.csv ../toy/dep.csv ../toy/labtarg.csv > example_model.lp

hplan.txt:  planning/nyearplan.class  planning/nyearHarmony.class    Makefile
	java planning.nyearHarmony ../toy/flows.csv ../toy/cap.csv ../toy/dep.csv ../toy/labtarg.csv > hplan.txt

planning/testeconomy.class:planning/testeconomy.java
	javac planning/testeconomy.java

planning/nyearHarmony.class:planning/Harmonizer.java planning/TechnologyComplex.java planning/JointProductionTechnique.java planning/nyearHarmony.java planning/Technique.java
	javac planning/nyearHarmony.java

result.csv:testflow.csv testcap.csv testdep.csv testtarg.csv planning/nyearHarmony.class
	java planning.nyearHarmony testflow.csv testcap.csv testdep.csv testtarg.csv >result.csv
	tail --lines=2 result.csv

pasresult.csv:testflow.csv testcap.csv testdep.csv testtarg.csv pasharm/harmonyplan
	pasharm/harmonyplan testflow.csv testcap.csv testdep.csv testtarg.csv >pasresult.csv
	tail --lines=2 pasresult.csv
