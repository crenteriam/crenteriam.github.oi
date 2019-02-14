---
title: Display Descriptive Statistics Tables in Latex Documents
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---
| **Dynamic Documents with Stata.** Tools for Integrating Your Research Workflow |

<a name="Contents"></a>
[Teaching](../../../teaching) &rarr; [Dynamic Documents with Stata](../dynamicdocs-stata)  &rarr; [Tables](../tables) &rarr; Display Descriptive Statistics Tables in Latex Documents


% DESCRIPTIVE STATISTICS -------------------------------------------------------
\subsection{Descriptive Statistics Tables}

Load the \verb|auto| dataset. Then, produce a descriptive statistics table for the variables mpg, price and weight with the command \verb|estpost|.

% VERBATIM ===================================================
\begin{Verbatim}[formatcom=\color{stata}]
sysuse auto
estpost sum mpg price weight
\end{Verbatim}
% VERBATIM ===================================================

This command produces the descriptive statistics table. Now, we need to export it as a .tex file. To do that, we will use the command \verb|esttab|. In the command chunk below you will notice a dot after \verb|esttab|. As shown in the section \ref{OLS_TABLES}, esttab is used by calling an object stored (either with \verb|estimates store| or \verb|eststo|). But in this case, we will use what Stata has in memory after running \verb|estpost sum mpg price weight|. The dot means "use the estimates that are currently in memory" (meaning, the last \verb|estpost| command that you ran). Then, name your file (if you are not using a working directory, use the complete path) with the extension .tex.

In the options that appear below, wathever is inside the \verb|cell(( ))| parenthesis will beis the statistic that will be shown (note that it has double parenthesis). In this case, we want the mean 'verb|mean()|, minimum \verb|min()| and maximum \verb|max()|. We also included the options \verb|nonnumber|, \verb|nomtitle|, and \verb|replace| (see Table 3 below for an explantation of these options).

% VERBATIM ===================================================
\begin{Verbatim}[formatcom=\color{stata}]
esttab . using ".\report\Table1.tex", ///
       cell((mean() min() max())) nonumber nomtitle replace
\end{Verbatim}
% VERBATIM ===================================================

Now, you have successfully saved your .tex file containing your table. Now, you just need to call that .tex file within your .tex document. To do that, you must first create an object with the command begin and tell \LaTeX\  that it's a table (see lines belwow). Next line will center the table. Then, by using the command \verb|input|, call your recently created \verb|Table1.tex| file (you don't need to write the file extension, since it is assumed is a .tex file). Next line \verb|caption| is the title of your table. Put your title whitin the braces. The title will be automatically numbered. The final line \verb|end| closes the object.

% VERBATIM ===================================================
\begin{Verbatim}[formatcom=\color{latex}]
\begin{table}[H]
\centering
	\input{Table1}
\caption{Summary Statistics}
\end{table}
\end{Verbatim}
% VERBATIM ===================================================

By using those five lines, you table will be inserted in your document and should look like this:

\begin{table}[H]
\centering
	\input{Ancillary/Tables/04_01_Table1.tex}
\caption{Summary Statistics}
\end{table}

HERE LINK TO THE DOFILE.

% ================================================================================
% ================================================================================
% CONTRIBUTION FROM DINGNAN
