

clear all
sysuse auto
cd "C:\Users\rente\OneDrive\Escritorio\wdir"
capture mkdir tables

* Create descriptive statistics table
estpost summarize mpg price weight

* Save table as .tex file
estimates store DescriptivesAuto
esttab DescriptivesAuto using ".\tables\Table1.tex", cell(mean() min() max()) replace

* Save formatted table as .tex file
 esttab DescriptivesAuto using ".\tables\Table2.tex", label nonnumbers nomtitle replace
