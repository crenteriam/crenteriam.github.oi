---
title: Tables
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---

<a name="Contents"></a>
<p style="text-align: center;">
<a href="https://crenteriam.github.io/training/dynamic-documents/dynamicdocs-stata/">Dynamic Documents with Stata</a>
</p>
<p style="text-align: center;">
Tables &rarr; - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-stata/">Latex Table in Stata</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-descriptives/">Descriptive Stats</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-ols/">Regression</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/tables-personalized/">Personalized</a>
</p>

### Linking the Table to the Latex Documents

The code chunk below represents a simple Latex table with two columns and two rows.

```latex
\begin{table}[h]
    \begin{tabular}{c|c}
        Cell A & Cell B \\
        Cell C & Cell D \\
    \end{tabular}
\end{table}
```

The whole ***table*** enviornment is contained between the lines `\begin{table}` and `\end{table}`. But the environment ***table*** does not contain the *actual table*, only the *metadata of the table*, such as the title, a a reference key, and the horizontal and vertical positioning, among others (all will be discussed below).

The *actual table* is contained within the environment ***tabular*** which is contained between `\begin{tabular}` and `\end{tabular}`. And the environment ***taular*** is placed within the environment ***table***.

Above, in the chunk code, at the right side of `\begin{tabular}`, says `{c|c}`. This is the instruction of the number of <u>columns</u> you want to the table to have. But instead of providing the number of columns, we are providing letters. Each letter counts for one column, and the letter carries meaning. The letters indicates the alignment of the text within the column. For example, `c` stands for centered text, `r` for right-sided text, and `l` for left-sided text. The pipe `|` means you want to draw a vertical line between columns. But if you don't want to print verical lines between the columns, you must leave a blank space instead. For example, if I type `{l c c}`, I am speficying a ***tabular*** with three columns without vertical lines. The first column will have left-sided text, and the remaining two will center the text.

Note that there is an `[h]` at the right side of `\begin{table}`. This indicates the vertical position of the table---`h` means the table should be placed *here*. (See full explanation below about [vertical positioning](#floats)).

The <u>rows</u> have a different logics. Each programming line is a row. Each row has to end with `\\` which is equivalent to hit enter in your word processor. For example, from the code chunk above `Cell A & Cell B \\` represents the first row of the table. As for that chunk we definded two columns, *Cell A* will be the text contained in the first row and first column. The symbol `&` separates columns within the same row. For example, in the chunk above, the text `Cell B` will be the contents of the second column, as it resides at the right of `&`. Since we only have two columns in the example, the next step is to end the line with `\\`. Naturally, indicating a different number of columns in the rows than the number indicated in `\begin{tabular}` will produce and error (which is happens often).

[Up](#Contents)

### Basic Editing of Lates Tables

**Caption.** Use the command `\caption{}` to generate the <u>title of the table.</u> Type the command before `\begin{tabular}` to place the title above the table, or type `\caption{}` after `\end{tabular}` to place the title below the table.

The command `\caption{}` will automatically print the corresponding numeration of the table. Sometimes you may want to [title a table without numeration](https://tex.stackexchange.com/questions/28392/how-to-suppress-caption-numbering-in-a-table). In those casues, you must the command `\caption*{}` instead, which comes with the package `caption`.

**Label.** The command `\label{}` helps you creating a reference key to reference a table in the text. For example, when you write 'The Table 1 shows that...' instead of typing the Table number, you can type the table key reference by using the command `\ref{}`, which will automatically display the number, according to its current appearance in the text.

**Horizontal centering.** The command `\centering` is used at the begining of the ***table*** environment to arrange the table horizontally centered.

**Horizontal Lines.** Add horizontal lines to the table with the command `\hline`. This command should be used within the ***tabular*** environment. You can also use the alternatives `\toprule`, `\midrule`, and `\bottomrule`, which are available after loading the package `booktabs`.

<a name="floats"></a> **Vertical Positioning (floats).** Both Tables and Figures are [float environments](https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions) which means Latex is going to make some decisions on where to place them in the page. In the options after beginning any of these two enviornments, you can use a *placement specifier*. For example, `[h]` means *here*, or `[t]` means at the top of the page. See this brief [explanation from Overleaf Documentation]() about *placement specifiers*.[^1] The problem, however, is that none of these will always place *exactly here* the table of figure; the best way to go is by using the *placement specifier* `[H]`, from the package `float`. When stacking together multiple floats, this specifier tends lo leave too much space between floats, and `[h!]` may work better. (Almost) nothing is perfect.

<u>The example below applies all the edits previously discussed:</u>

```latex
\begin{table}[h!]
\centering
    \begin{tabular}{c|c}
        \hline
        Column A & Column B \\
        \hline
        Cell A & Cell B \\
        Cell C & Cell D \\
        \hline
    \end{tabular}
    \caption{Title of the Table}
    \label{tab:example}
\end{table}

The Table \ref{tab:example} shows that...
```

<div style="text-align:center"><img src ="..." /></div>

**Multiple Columns** TBD.

**Multiple Rows** TBD.

**Rotating Text** TBD.

### Table Size {#TableSize}

There are three common issues related with the table size. Typically, the table width can be <u>wider</u> than the page width; the table can be <u>longer</u> than one page; or you might want to rotate the table to be printed as <u>landscape-like</u>. The environment ***tabular*** cannot performe any of these tasks. Therefore you need one of the following alternatives.

**The table is wider than the text width.** Here, main problem with the environment ***tabular*** is that it strictly respects the width of your character string in that cell. That means that if you have a string such as "This is a long string", ***tabular*** will not break down that sentence into multiple lines. [Extended explanation](https://tex.stackexchange.com/questions/10535/how-to-force-a-table-into-page-width).

There are two ways to hack that problem. The first one is to **manually defining the with of the column.** To do so, you must replace the column letter (e.g., `c`) by `p{}` and define the lenght in points (px), centimeters (cm) or inches (in). For example, in the table below, the first column is fixed to 3 centimeters and the second column to 3 inches.

```latex
% Solution 1 (fixing the column widths)
\begin{table}[h]
    \centering
    \begin{tabular}{p{3cm} p{3in}}
        "This is a long string" & "Text" \\
        "Text" & "Text" \\
    \end{tabular}
\end{table}
```

```latex
% Solution 2 (using tabularx)
% Note that there is an extra {} (just after
% the {tabularx}.
\begin{table}[h]
    \centering
    \begin{tabularx}{\textwidth}{X X}
        "This is a long string" & "Text" \\
        "Text" & "Text" \\
    \end{tabularx}
\end{table}
```

When you have a **table longer than the page length**, neither ***tabular*** nor ***tabularx*** are of help. You will need to use the package `longtable`. After installing this package, you will be able to use the environment ***longtable*** in replacement of the environment <u>***table***</u>.

```latex
% Using environment longtable
\begin{longtable}
\end{longtable}
```

To rotate a table to be printed horizontally or as **landscape-like**, you will need either the package `xxx` or `xxx`.

```latex
% landscape solution
```

Download the [practice Do-File on Tables OLS](https://crenteriam.github.io/files/tutorials/tables-latex.do).

[Up](#Contents)

[^1]: This stackexchange tread has about everything you need to know about [how to influence the position of float environments like figure and table in Latex](https://tex.stackexchange.com/questions/39017/how-to-influence-the-position-of-float-environments-like-figure-and-table-in-lat)
