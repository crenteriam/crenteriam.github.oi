Best practices on coding:

Working with coefficients
----
We saw in Matt Golder's code how to grab the values for coefficient (and standard error). For example:

reg instab democracy
matrix b=e(b)
scalar b1=b[1,1]
display b1

An easier way to grabbing the coefficient is by using this command: _b[VarName] (and _se[VarName] for standard errors). For example:

display _b[democracy]
display _b[_cons]

That way you can manage easier your calculations with coefficients. For example:

display _b[democracy] + _b[_cons]

OR

scalar effect =  _b[democracy] + _b[_cons]
display effect

When creating variables, we usually we set the initial values = 0. For example:

female = 0

And then fill it up. For example

recode female = 1 if male ==0

This may cause you trouble sometimes because of missing values. Suppose that there are some values that are not female or male, but missing values. Then, with this transformation, you have mistakenly assigned a zero (male). Careful.

A good practice to avoid this is to set any new generated variable with a starting missing value.

Furthermore, there are two types of missing values in Stata. Those represented by a point "." are values that could be assigned by you or by Stata (sometimes). And there are missing values ".a" or ".b" up to z, and those could be set only by you. Try to use the latter always (pick your favorite letter), so you're sure you placed that missing and does not come from somewhere else.

gen female = .k
replace female = 1 if male == 0


TURNO OFF/ON CHUNKS OF CODE:

I guess sometimes when you're working in your assignments and you're on the last questions, it's annoying to wait for stata to run all the do-file until we are where we want. Alternatively I guess you select the blocks you want, but I find that annoying also.

One nice way to skip that and a specific question (say Exercise 5, part E). Is to combine macros and the function "if". It's really simple.

First, create one macro per block (i.e. per question). Then, you just have to assign a zero or one to your macro. Zero if you want the block off and one if you want it on. So you just turn on and off whenever you want by just changing 0/1.

global MyQuestion1 1
global MyQuestion2 0

At the beginning of each block use this line:

if $MyQuestion {

* Here goes the corpus of your coding. And after you finish, you have to end with the next line:
}

Again, when the value in the macro is zero, everything within the { } will be ignored.

EXAMPLE:

version 14
clear all
use "C:\Users\César\OneDrive\PhD Albany\2017 Spring\POS 517 TA\_Assignments\Assignment 7 Ch7\A7_Data\speeding_tickets_text.dta", clear
*-------------------------------------------------------------
global e5b 0
global e5d 0
global e5f 1

gen AgeSq = Age* Age
gen AgeNeg = 98 - Age
gen AgeNeg2 = AgeNeg^2
*-------------------------------------------------------------
* E5b
if $e5b {

regress Amount AgeNeg AgeNeg2 MPHover Female Black Hispanic
predict zhat
gen zhatneg = 523.247 - zhat
regress Amount Age AgeSq MPHover Female Black Hispanic
predict yhat

* E5b1 What is the fitted value for age = 25?
*A (correct)
disp _b[_con] + _b[Age]*25 + _b[AgeSq]* 25^2
*B
disp _b[_con] + _b[Age]*25
*C
disp _b[_con] + _b[Age]*25 - _b[AgeSq]* 25^2
*D
disp _b[Age]*25 + _b[AgeSq]* 25^2

* E5b2 Select among the following sketchs the one that best represents the relationship between age and fines

graph twoway (lfit yhat Age),name(A) xscale(off) yscale(off) title("A")
graph twoway (fpfit AgeSq Age),name(B) xscale(off) yscale(off) title("B")
graph twoway (qfit yhat AgeSq), name(C)	xscale(off) yscale(off) title("C")
graph twoway (qfit zhatneg Age), name(D) xscale(off) yscale(off) title("D")

* C is correct
graph combine A B C D, b1title("X = Age") l1title("Y = Effect")
cd "C:\Users\César\Desktop"
graph export E5G1.png,replace
*graph close
}

*-------------------------------------------------------------
* E5d
if $e5d {
*A (correct)
disp -_b[Age]/(2*_b[AgeSq])
*B
disp _b[Age]/(2*_b[AgeSq])
*C
disp -_b[_cons]
*D
disp -_b[Age]/(_b[AgeSq])
}

*-------------------------------------------------------------
*E5f
if $e5f {
gen State_OutTown 	=  OutTown	* StatePol
gen State_OutState 	=  OutState	* StatePol
regress Amount Age AgeSq MPHover Female Black Hispanic  OutTown  OutState State_OutTown State_OutState

*A (correct)
test State_OutTown = State_OutState = 0
*B
test State_OutTown - State_OutState = 1
*C
test State_OutTown = OutState
*D
test OutState = OutTown
}
clear all
