---
title: Display Personalized Tables in your Latex Document
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---
| **Dynamic Documents with Stata.** Tools for Integrating Your Research Workflow |

<a name="Contents"></a>
[Teaching](../../../teaching) &rarr; [Dynamic Documents with Stata](../dynamicdocs-stata)  &rarr; [Tables](../tables) &rarr; Display Personalized Tables in your Latex Document


% VERBATIM ===================================================
\begin{Verbatim}
\begin{tabular}{|c|c|c|}
    Row 1, Column 1 & Row 1, Column 2 & Row 1, Column 3 \\
    Row 2, Column 1 & Row 2, Column 2 & Row 2, Column 3 \\
\end{tabular}
\end{Verbatim}
% VERBATIM ===================================================

\begin{tabular}{|c|c|c|}
    Row 1, Column 1 & Row 1, Column 2 & Row 1, Column 3 \\
    Row 2, Column 1 & Row 2, Column 2 & Row 2, Column 3 \\
\end{tabular}

% VERBATIM ===================================================
\begin{Verbatim}
\begin{tabular}{ l c r }
    Row 1, Column 1 & Row 1, Column 2 & Row 1, Column 3 \\
    Row 2, Column 1 & Row 2, Column 2 & Row 2, Column 3 \\
\end{tabular}
\end{Verbatim}
% VERBATIM ===================================================

\begin{tabular}{ l c r }
    Row 1, Column 1 & Row 1, Column 2 & Row 1, Column 3 \\
    Row 2, Column 1 & Row 2, Column 2 & Row 2, Column 3 \\
\end{tabular}

% VERBATIM ===================================================
\begin{Verbatim}
\begin{tabular}{ l c r }
    \hline
    Header 1 & Header 2 & Header 3 \\
    \hline
    Row 1, Column 1 & Row 1, Column 2 & Row 1, Column 3 \\
    Row 2, Column 1 & Row 2, Column 2 & Row 2, Column 3 \\
    \hline
\end{tabular}
\end{Verbatim}
% VERBATIM ===================================================

\begin{tabular}{ l c r }
    \hline
    Header 1 & Header 2 & Header 3 \\
    \hline
    Row 1, Column 1 & Row 1, Column 2 & Row 1, Column 3 \\
    Row 2, Column 1 & Row 2, Column 2 & Row 2, Column 3 \\
    \hline
\end{tabular}


% VERBATIM ===================================================
\begin{Verbatim}
\begin{table}
\centering
\begin{tabular}{ l c r }
    \hline
    Header 1 & Header 2 & Header 3 \\
    \hline
    Row 1, Column 1 & Row 1, Column 2 & Row 1, Column 3 \\
    Row 2, Column 1 & Row 2, Column 2 & Row 2, Column 3 \\
    \hline
\end{tabular}
\caption{Titlefor the Table}
\label{ref:tab1}
\end{table}
\end{Verbatim}
% VERBATIM ===================================================

\begin{table}[H]
\centering
\begin{tabular}{ l c r }
    \hline
    Header 1 & Header 2 & Header 3 \\
    \hline
    Row 1, Column 1 & Row 1, Column 2 & Row 1, Column 3 \\
    Row 2, Column 1 & Row 2, Column 2 & Row 2, Column 3 \\
    \hline
\end{tabular}
\caption{Titlefor the Table}
\label{ref:tab1}
\end{table}

\therule
Further reading for doing tables:

https://tex.stackexchange.com/questions/146127/how-can-i-insert-simple-table-notes/146129?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
\therule


\subsubsection{Making a table fit the page margins}

A common problem when doing personalized tables is that the table does not fit the page. Usually this is because \LaTeX\ strictly maintains the column width of the text in the column. For example, if you only have YES/NO answers in the table, the column will be small, but if you have a cell with a sentence like this "This is a dichotomous variable indicating whether or not the group adheres to a religious ideology, but not ethnic." that will be the width of your column and will spread beyond the paper margins. See below:

% VERBATIM ===================================================
\begin{Verbatim}
\begin{table}[H]
\centering
\caption{Variables used in the regression}
\begin{tabular}{ c c c c }
\hline % Added horizontal line
\textbf{Variable Name} & \textbf{Variable Name in Dataset} &
\textbf{Ready to Use} & \textbf{Notes} \\
\hline
% Row 1
Drug Trade & drugtrade2 & Yes & This variable is from Big
Allied and Dangerous 2 (BAAD) Dataset. It is generally
collected on a yearly basis, but was collapsed to match other
data used. \\

% Row 2
Military Personnel per Captia & milperPerCap & Yes & This
variable is retrieved from the Correlates of War (COW)
Dataset. The value for 1998 was used for each group's home
country. \\

% Row 3
Number of Network Connections & Degree & Yes & This variable
is retrieved from the Terrorism Knowledge Base (TKB) Dataset.
It represents a count of the alliances the organization has
with other terrorist organizations. \\
\hline
\end{tabular}
\end{table}
\end{Verbatim}
% VERBATIM ===================================================

\begin{table}[H]
\centering
\caption{Variables used in the regression}
\begin{tabular}{ c c c c }
\hline % Added horizontal line
\textbf{Variable Name} & \textbf{Variable Name in Dataset} & \textbf{Ready to Use} & \textbf{Notes} \\
\hline
Drug Trade & drugtrade2 & Yes & This variable is from Big Allied and Dangerous 2 (BAAD) Dataset. It is generally collected on a yearly basis, but was collapsed to match other data used. \\
Military Personnel per Captia & milperPerCap & Yes & This variable is retrieved from the Correlates of War (COW) Dataset. The value for 1998 was used for each group's home country. \\
Number of Network Connections & Degree & Yes & This variable is retrieved from the Terrorism Knowledge Base (TKB) Dataset. It represents a count of the alliances the organization has with other terrorist organizations. \\
\hline
\end{tabular}
\end{table}

There are two ways to fix it. First is by changing the option center \verb|c| by a fixed width. For example, the table above will be reformatted by changing \verb|\begin{tabular}{ c c c c }| by:

% VERBATIM ===================================================
\begin{Verbatim}
\begin{tabular}{ p{3cm} p{3cm} p{3cm} p{7cm} }
\end{Verbatim}
% VERBATIM ===================================================

Where the first three columns are 3 centimeters wide, and the fourth is 7 centimeters wide. See the result below:

\begin{table}[H]
\centering
\caption{Variables used in the regression}
\begin{tabular}{ p{3cm} p{3cm} p{2cm} p{7cm} }
\hline
\textbf{Variable Name} & \textbf{Variable Name in Dataset} & \textbf{Ready to Use} & \textbf{Notes} \\
\hline
Drug Trade & drugtrade2 & Yes & This variable is from Big Allied and Dangerous 2 (BAAD) Dataset. It is generally collected on a yearly basis, but was collapsed to match other data used. \\
Military Personnel per Captia & milperPerCap & Yes & This variable is retrieved from the Correlates of War (COW) Dataset. The value for 1998 was used for each group's home country. \\
Number of Network Connections & Degree & Yes & This variable is retrieved from the Terrorism Knowledge Base (TKB) Dataset. It represents a count of the alliances the organization has with other terrorist organizations. \\
\hline
\end{tabular}
\end{table}

The second alternative is by using the package \verb|tabularx|. By using this package, we can fit the table to exactly align with text margins. X divides the whole table into equal parts and that will be the width for every column marked with X. You might want to use this with the long, columns, but not with the shorts. I took out the pipe to take out the vertical lines. I used textwidth to say that I want the table so it reaches the wide margins. When using tabularx, you must specify the length of the table in the second bracket. For example, here the second bracket specifies it as textwidth: \verb|\begin{tabularx}{\textwidth}{X X X X}|.

% VERBATIM ===================================================
\begin{Verbatim}
\begin{table}[H]
\centering
\caption{Variables used in the regression}
\begin{tabularx}{\textwidth}{ X X X X}
\hline
\textbf{Variable Name}  & \textbf{Variable Name in Dataset} &
\textbf{Ready to Use} & \textbf{Notes} \\
\hline

% Row 1
Drug Trade & drugtrade2 & Yes & This variable is from Big
Allied and Dangerous 2 (BAAD) Dataset. It is generally collected
on a yearly basis, but was collapsed to match other data used.\\

% Row 2
Military Personnel per Captia & milperPerCap & Yes & This variable
is retrieved from the Correlates of War (COW) Dataset. The value
for 1998 was used for each group's home country. \\

% Row 3
Number of Network Connections & Degree & Yes & This variable is
retrieved from the Terrorism Knowledge Base (TKB) Dataset. It
represents a count of the alliances the organization has with
other terrorist organizations. \\
\hline
\end{tabularx}
\end{table}
\end{Verbatim}
% VERBATIM ====================================================

\begin{table}[H]
\centering
\caption{Variables used in the regression}
\begin{tabularx}{\textwidth}{ X X X X}
\hline
\textbf{Variable Name} & \textbf{Variable Name in Dataset} & \textbf{Ready to Use} & \textbf{Notes} \\
\hline
% Row 1
Drug Trade & drugtrade2 & Yes & This variable is from Big Allied and Dangerous 2 (BAAD) Dataset. It is generally collected on a yearly basis, but was collapsed to match other data used.\\
Military Personnel per Captia & milperPerCap & Yes & This variable is retrieved from the Correlates of War (COW) Dataset. The value for 1998 was used for each group's home country. \\
Number of Network Connections & Degree & Yes & This variable is retrieved from the Terrorism Knowledge Base (TKB) Dataset. It represents a count of the alliances the organization has with other terrorist organizations. \\
\hline
\end{tabularx}
\end{table}

You can also mix with the first strategy. For example, you can change the column type \verb|X| by \verb|c| or \verb|p{3cm}|. For example, the we substituted the line:

% VERBATIM ===================================================
\begin{Verbatim}[gobble=1]
%\begin{tabularx}{\textwidth}{ X X X X }
\end{Verbatim}
% VERBATIM ===================================================

By the line:

% VERBATIM ===================================================
\begin{Verbatim}[gobble=1]
%\begin{tabularx}{\textwidth}{p{2cm} p{2cm} p{1cm} X}
\end{Verbatim}
% VERBATIM ===================================================

\begin{table}[H]
\centering
\caption{Variables used in the regression}
\begin{tabularx}{\textwidth}{p{2cm} p{2cm} p{1cm} X}
\hline
\textbf{Variable Name}          & \textbf{Variable Name in Dataset} & \textbf{Ready to Use} & \textbf{Notes} \\
\hline
Drug Trade & drugtrade2 & Yes & This variable is from Big Allied and Dangerous 2 (BAAD) Dataset. It is generally collected on a yearly basis, but was collapsed to match other data used.\\
Military Personnel per Captia & milperPerCap & Yes & This variable is retrieved from the Correlates of War (COW) Dataset. The value for 1998 was used for each group's home country. \\
Number of Network Connections & Degree & Yes & This variable is retrieved from the Terrorism Knowledge Base (TKB) Dataset. It represents a count of the alliances the organization has with other terrorist organizations. \\
\hline
\end{tabularx}
\end{table}

% ------------------------------------------------------------
\subsubsection{Print a table in multiple pages}

Use package longtable.
