/*-------------------------------------------------------------------------------
Title: Stata & Latex: Tables with estout
REPORTING
Authors: Matthew Ingram & Cesar Renteria
Date: 02/17/2018
File Description: */
*-------------------------------------------------------------------------------
*Environment Setup
clear all
set more off
set linesize 70
capture log close

* Packages you may need for MarkDoc and LaTeX
* packages for MarkDoc
* ssc install Markdoc
* ssc install weaver
* ssc install synlight
* ssc install statax
* markdocpandoc // installs pandoc
* packages for analysis and presentation of results
* ssc install estout, replace
* ssc install outreg
* ssc install pandoc

*Set working directory, and create folders
cd "C:\Users\César\OneDrive\PhD Albany\2018 Spring\POS 517 TA\MiniLabs\Stata_Latex_Tables"
capture mkdir data
capture mkdir figures
capture mkdir output
capture mkdir tables
capture mkdir report

*===============================================================================
* STATA PROCESSING
*===============================================================================
sysuse auto

* Table 1. Descriptive Statistics
estpost sum mpg price weight      // Produce the table, but not the output file (the .tex file)

*Output Descriptive Statistics
*"." means the thing that you last ran. I SHOULD NAME IT ABOVE.
*"Table1.tex" Is the name I decided to give it. You can also produce a Word file with extension .rtf (SEE OTHERS)
* IMPORTANT: THE Table1.tex FILE MUST BE IN THE SAME FOLDER THAN YOUR FINAL LATEX REPORT. IN THIS CASE IS THE FOLDER "REPORT".
esttab . using .\report\Table1.tex, cell((mean(fmt(%9.2f)) sd(fmt(%9.2f)) min(fmt(%9.1g)) max(fmt(%9.1g)))) nonumber nomtitle label replace

*-------------------------------------------------------------------------------
*REGRESSIONS

*TABLE 2. Output only one model
reg price mpg
estimates store Model1

esttab Model1 using ".\report\Table1.tex", b(a2) r2(2) replace ///
										   label nonumbers mtitles("Model 1")

*TABLE 2. Output multiple models
reg price mpg weight              // Try adding one variable to the initial bivariate model
estimates store Model2
reg price mpg weight foreign      // Try adding another variable
estimates store Model3

*Output Regression
esttab Model1 Model2 Model3 using ".\report\Table2.tex", b(a2) r2(2) replace ///
										   label nonumbers mtitles("Model 1" "Model 2" "Model 3")

*TABLE 3. Output different dependent variables
reg gear_ratio mpg weight foreign // Let's try a different dependent variable
estimates store Model4										   
esttab Model1 Model2 Model3 Model4 using ".\report\Table3.tex", b(a2) r2(2) replace ///
										   label nonumbers mtitles("Model 1" "Model 2" "Model 3" "Model 4")
clear
*===============================================================================
* LATEX DOCUMENT
*===============================================================================
quietly log using ".\report\Stata_Latex_Tables_estout", replace

/***
\documentclass[letter, 12pt]{article}

% Begin of formatting ----------------------------------------------------------
% Text after percentage sign are comments and won't show up in your text.
% The lines below load some packages needed.

\usepackage[utf8]{inputenc}     % allows a variety of characters
\usepackage{geometry}           % formatting document
\usepackage[english]{babel}     % allow the use of a variety of languages
\usepackage{graphicx}           % for inserting graphics
\usepackage{hyperref}           % for insterting hyper references
\usepackage{float}              % for placing the figures in the right place
\usepackage [autostyle, english = american]{csquotes} 
\MakeOuterQuote{"} % Avoid annoying quotation marks

% The lines below are formatting the document with the package "geometry"

\hypersetup{colorlinks = true, linkcolor = blue, filecolor = black,      
            urlcolor = blue, citecolor = blue}
\geometry{letterpaper, total={6.5in, 9in},
          left=1in, right=1in, top=1in, bottom=1in}

% End of formatting ------------------------------------------------------------

\begin{document}

% HEADER --------------------------------------------------------------------- 

\title{Stata and \LaTeX: Tables with estout}
\author{RPAD/RPOS 517 \\
Quantitative Methods \\
Rockefeller College of Public Affairs \& Policy \\
University at Albany, SUNY}
\date{\today}
\maketitle

% BRIEF NOTE ABOUT THIS DOCUMENT ---------------------------------------------- 
\subsection*{Brief note about this document}
This is a short tutorial to create publishable tables from Stata. There are few options with 
user-written packages. The ones you must know are \verb|outreg2| and 
\verb|estout|. The package \verb|outreg2| is probably most known 
and easier to learn and manage than \verb|estout|; however, is less flexible 
and less integrated with the \LaTeX\ environment. But you might find it more 
beneficial if you do not intend to intend to do statistical analysis ocasionally.

On the other hand, \verb|estout| is a more robust package that has a neat 
integration with \LaTeX. During the course we will rely on 
\verb|estout| to produce the tables for the assignments. This tutorial shows 
you how to create basic descriptive statistics and regression tables 
with \verb|estout|.

For further details on the packages, please refer to the full documentation of 
\href{http://repec.sowi.unibe.ch/stata/estout/}{estout} and 
\href{http://repec.org/bocode/o/outreg2.html}{outreg2}.

% GETTING STARTED --------------------------------------------------------------
\section{Getting Started}

Install the package with the command \verb|ssc install estout|. For this tutorial, 
we are going to use the built-in dataset auto. Load it with the line 
\verb|sysuse auto|.

To make our publishable tables, we will need three packages. The first one is 
\verb|estimates store|; this is a Stata's official command. Then, the command 
\verb|estpost| will help us to create the Descriptive Statistics table, whereas 
the command \verb|esttab| will help us to create the Regression tables.

% DESCRIPTIVE STATISTICS -------------------------------------------------------
\section{Descriptive Statistics}

First, load the data.
\begin{verbatim}
***/
sysuse auto
/***
\end{verbatim}

Then, we are going to produce a descriptive statistics table for the variables 
mpg, price and weight with the command \verb|estpost|.
\begin{verbatim}
***/
quietly estpost sum mpg price weight
/***
\end{verbatim}

This command produces the descriptive statistics table. Now, we need to export it 
as a .tex file. To do that, we will use the command \verb|esttab|. In this case, 
the dot means "use the estimates that are currently in memory" (meaning, the last 
\verb|estpost| command that you ran). Then, name your file (if you are not using 
a working directory, use the complete path) with the extension .tex.

In the options that appear below, wathever is inside the \verb|cell(( ))| parenthesis 
will beis the statistic that will be shown (note that it has double parenthesis). 
In this case, we want the mean 'verb|mean()|, minimum \verb|min()| and maximum 
\verb|max()|. We also included the options \verb|nonnumber|, \verb|nomtitle|, and 
\verb|replace| (see Table 3 below for an explantation of these options).
\begin{verbatim}
***/
esttab . using ".\report\Table1.tex", cell((mean() min() max())) ///
			  nonumber nomtitle replace
/***
\end{verbatim}

Now, you have successfully saved your .tex file containing your table. Now, 
you just need to call that .tex file within your .tex document. To do that, you must
first create an object with the command begin and tell \LaTeX\  that it's a table 
(see lines belwow). Next line will center the table. Then, by using the command 
\verb|input|, call your recently created \verb|Table1.tex| file (you don't neet 
to write the file extension, since it is assumed is a .tex file). Next line 
\verb|caption| is the title of your table. Put your title whitin the braces. 
The title will be automatically numbered. The final line \verb|end| closes the 
object.
\begin{verbatim}

\begin{table}[H]
\centering
	\input{Table1}
\caption{Summary Statistics}
\end{table}

\end{verbatim}

By using those five lines, you table will be inserted in your document and should 
look like this:

\begin{table}[H]
\centering
	\input{Table1}
\caption{Summary Statistics}
\end{table}

		
% Regression -------------------------------------------------------------------
\section{Regression}

To make a regression table, first run the regression model. In this case, we will 
start with a bivariate model of mileages per hour on price.
\begin{verbatim}
***/
quietly reg price mpg weight
/***
\end{verbatim}

The results are stored in temporary memory. We must save the results with the 
command \verb|estimates store|. To do that, type \verb|estimates store| and then 
give the results a name (e.g. Model1).
\begin{verbatim}
***/
estimates store Model1
/***
\end{verbatim}

Now, produce the .tex file for this table. Use the command \verb|esttab|. Then, 
name the stored model you want to include in the table. In this case, we want our 
stored \verb|Model1|. after the word \verb|using| name the file path and the file 
name (if you are using a working directory, you only need the latter, as in the 
example below). Include the option \verb|replace|.
\begin{verbatim}
***/
esttab Model1 using ".\report\Table2.tex", replace
/***
\end{verbatim}

The .tex file containing the table must be created at this moment. To insert the 
table in the document, follow the same process as with the descriptive statistics:
\begin{verbatim}

\begin{table}[H]
\centering
	\input{Table2}
\caption{Regression. Bivariate Model}
\end{table}

\end{verbatim}

See the results below:

\begin{table}[H]
\centering
	\input{Table2}
\caption{Regression. Bivariate Model}
\end{table}

Finally, we will expand the regression table. We will include more models and more 
options. We will create a \verb|Model2|, which includes the independent variable 
\verb|weight| and a \verb|Model3| which includes the independent variables 
\verb|weight| and \verb|foreign|. Save the results with \verb|estimates store| 
for each model:
\begin{verbatim}
***/
quietly reg price mpg weight
estimates store Model2
quietly reg price mpg weight foreign
estimates store Model3
/***
\end{verbatim}

To create the .tex file containing the table, we use again the command \verb|esttab|. 
Now, we will include our three models stored. We will also include the options 
\verb|nonumbers| (will take out the number from the heading row), \verb|label| 
(will use Stata's labels in the variable colums), and \verb|mtitles| (to name 
the results colums with our own titles). We also want to add the r-squared by 
including the option \verb|r2(2)|.
\begin{verbatim}
***/
esttab Model1 Model2 Model3 using ".\report\Table3.tex", ///
r2(2) replace label nonumbers mtitles("Model 1" "Model 2" "Model 3")
/***
\end{verbatim}

The new \verb|Table3.tex| file will produce this table:

\begin{table}[H]
\centering
	\input{Table3}
\caption{Summary Statistics}
\end{table}
				
% NEXT STEPS -------------------------------------------------------------------
\section{Extra functions}

\begin{itemize}
\item What is \href{https://www.sharelatex.com/learn/Positioning_of_Figures}{the [H]} 
symbol that appears besides the command "begin table"?

\item To manipulate the table numeration use the package 
\href{https://tex.stackexchange.com/questions/28392/how-to-suppress-caption-numbering-in-a-table}{caption}

\item For more fine-grained manipulation of estout tables, see 
\href{https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm#summary}{this documentation}.

\item To use labels in Stata see \href{https://www.stata.com/manuals13/gsw9.pdf}{here} 
(it's better is you do this in the data management do-file).

\item You can check out the companion do-file of this document on blackboard.

\item My table doesn't fit the page. How can I 
\href{https://tex.stackexchange.com/questions/10535/how-to-force-a-table-into-page-width}{solve it}?
\end{itemize}

% End of the Document ----------------------------------------------------------
\end{document}
***/

log close
* Make the Tex File
markdoc ".\report\Stata_Latex_Tables_estout", replace export(tex) markup()

* Use the shell ("!") command to call the program pdflatex and then compile the PDF
* In jobname you can choose the name of your pdf.
* In output-directory you can select where your .tex file is
* In -aux-directory, you can redirect all the buch of complementary files produced in the compilation
!pdflatex Stata_Latex_Tables_estout.tex -no-shell-escape ///
--jobname="Stata_Latex Tables" Stata_Latex_Tables_estout              ///
-output-directory="C:\Users\César\OneDrive\PhD Albany\2018 Spring\POS 517 TA\MiniLabs\Stata_Latex_Tables" ///
-aux-directory="C:\Users\César\OneDrive\PhD Albany\2018 Spring\POS 517 TA\MiniLabs\Stata_Latex_Tables\report"

*End of Do-File.
