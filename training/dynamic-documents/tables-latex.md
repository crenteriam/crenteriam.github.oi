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

The whole ***table*** enviornment is contained between the lines `\begin{table}` and `\end{table}`. But the environment ***table*** does not contain the *actual table*, only the *metadata*, such as the title, a label for hyperreference, the horizonta and positioning, among others (as we will see below).

The *actual table* is contained within the environment ***tabular*** which is contained between `\begin{tabular}` and `\end{tabular}`. At the right side of `\begin{tabular}`, says `{c|c}`. This is the instruction of the number of <u>columns</u> you want to the table to have. But instead of giving a number, we are providing a letter per each column, The letters mean the positioning of the text within the column; `c` stands for centered, `r` for right, and `l` for left. The pipe `|` means you want to draw a vertical line between columns. If you want no lines between colums, leave a blank space. For example, in `{l c c}` I am speficying a table with three columns without vertical lines. In the first column, the text will be left-sided, and centered in the remaning two columns.


Note that there is an `[h]` at the right side of `\begin{table}`. This is an option indicating that the table should be placed *here*.


The <u>rows</u> have a different logics. Between , each programming line is a row. Each row has to end with `\\` which is equivalent to hit enter in your word processor. For example, from the code chunk above `Cell A & Cell B \\` represents the first row of the table. As for that chunk we definded two columns, *Cell A* will be the text contained in the first row and first column. The symbol `&` will tell Latex to move to the next column, within the same row. Therefore, `Cell B` will be the contents of the second column. As we only have two columns, the next step is to end the line with `\\`.

- graphicsx package
- what is a float in footnote.
- bring this from latex book.


[Up](#Contents)

### Elementary Table Editing in Latex

**Caption.** Use the command `\caption{}` to generate the title of the table. Type the command before `\begin{tabular}` to place the title above the table, or type `\caption{}` after `\end{tabular}` to place the title below the table.

**Label.** The command `\label{}` helps you creating a reference key to reference a table in the text. For example, when you write 'The Table 1 shows that...' instead of typing the Table number, you can type the table key reference by using the command `\ref{}`, which will automatically display the number, according to its current appearance in the text.

**Centering.** This command is used at the begining of the ***table*** environment to place the table horizontally centered.

**Horizontal Lines** Add horizontal lines to the table with the command `\hline`. This command should be used within the ***tabular*** environment. You can also use the alternatives `toprule`, `midrule`, and `bottomrule`, which are available after loading the package `xxx`

The example below applies all the edits previously discussed:

```latex
\begin{table}[h]
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

**Vertical Positioning**
- float H. What is \href{https://www.sharelatex.com/learn/Positioning_of_Figures}{the [H]}

**Multiple Columns**
**Multiple Rows**
**Rotating Text**

- To manipulate the <u>table numeration</u>, use the package [caption](https://tex.stackexchange.com/questions/28392/how-to-suppress-caption-numbering-in-a-table).

### Table Size

There are three common issues related with the table size. Typically, the table width is <u>wider</u> than the text width. Also, the table could be <u>longer</u> than a page. Or you might want to print the table <u>rotated</u>. The environment ***tabular*** completely fails to meet these requirements. Therefore, you will need to use other environments.

**The table is wider than the text width.** Here, main problem with the environment ***tabular*** is that it strictly respects the width of your character string in that cell. That means that if you have a string such as "This is a long string", ***tabular*** will not break down that sentence into multiple lines. [Extended explanation](https://tex.stackexchange.com/questions/10535/how-to-force-a-table-into-page-width).

There are two ways to hack that problem. The first one is to **manually defining the with of the column.** To do so, you must replace the column letter (e.g., `c`) by `p{}` and define the lenght in points (px), centimeters (cm) or inches (in). For example, in the table below, the first column is fixed to 3 centimeters and the second column to 3 inches.

```latex
\begin{table}[h]
    \centering
    \begin{tabular}{p{3cm} p{3in}}
        "This is a long string" & "Text" \\
        "Text" & "Text" \\
    \end{tabular}
\end{table}
```

**The table is longer than the page length.**

**How can I rotate the table to be printed horizontally?**

[Up](#Contents)

### Workflow Best Practices

- table as separate file, and then use input. show some screens with this. Also helps bc R and Stata will provide table as separate file.

[Up](#Contents)
