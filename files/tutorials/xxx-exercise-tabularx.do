### dofile-exercies with tabularx
```latex
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
```
There are two ways to fix it. First is by changing the option center `c` by a fixed width. For example, the table above will be reformatted by changing `\begin{tabular}{ c c c c }` by:

```latex
\begin{Verbatim}
\begin{tabular}{ p{3cm} p{3cm} p{3cm} p{7cm} }
\end{Verbatim}
```

Where the first three columns are 3 centimeters wide, and the fourth is 7 centimeters wide. See the result below:

```latex
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
```

The second alternative is by using the package `tabularx`. By using this package, we can fit the table to exactly align with text margins. X divides the whole table into equal parts and that will be the width for every column marked with X. You might want to use this with the long, columns, but not with the shorts. I took out the pipe to take out the vertical lines. I used textwidth to say that I want the table so it reaches the wide margins. When using tabularx, you must specify the length of the table in the second bracket. For example, here the second bracket specifies it as textwidth: `\begin{tabularx}{\textwidth}{X X X X}`.

```latex
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
```


```latex
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
```

You can also mix with the first strategy. For example, you can change the column type `X` by `c` or `p{3cm}`. For example, the we substituted the line:

```latex
\begin{Verbatim}
%\begin{tabularx}{\textwidth}{ X X X X }
\end{Verbatim}
```

By the line:

```latex
\begin{Verbatim}[gobble=1]
%\begin{tabularx}{\textwidth}{p{2cm} p{2cm} p{1cm} X}
\end{Verbatim}
```

```latex
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
```
