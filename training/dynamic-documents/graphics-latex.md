---
title: Display Graphics in Latex Documents
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---

| [**Dynamic Documents with Stata.**](dynamicdocs-stata.md) Tools for Integrating Your Research Workflow |

<a name="Contents"></a>
<p style="text-align: center;">
 <a href="#">Previous section</a> &larr; Graphics &rarr; <a href="#">Next section</a>
</p>

### Display Graphics Latex

There are not Latex packages needed for displaying a graph in Latex, but we recommend `graphicsx`, and `float`. We will come to that [below](#Edit).

The graph is now saved as a .png file in the folder `figures`. Next, we need to call the file in the Latex document by beginning an object type `figure` (see first line below).
The next line is `centering` the object. Centering means that the figure will be centered in the page.
The next line, `includegraphics`, tells Latex to display the graph named `Graph1.png` (the name of the file `Graph1.png` is in curly braces). Within the brackets, you can define many features for the figure. In this case, we defined the width as 4.5 inches, and height as 3 inches.
The command `caption` is used to title and number the graph.

```latex
\begin{figure}[h]
\centering
\includegraphics[width=4.5in,height=3in]{Graph1.png}
\caption{Scatterplot - mpg and price}
\end{figure}
```
This is how the Graph will be displayed:

![Display Graph Here](Ancillary/Graphics/04_01_G1.png)

[Up](#Contents)

### Edit Figures in Latex {#Edit}

- Reporting Descriptive Statistics and Regression outputs.
- Describe the two environments (figure and table). Describe basic logics of both (include tabular and longtable). Describe the H, h and h!.
Describe the basic packages: capton, float, graphicx.
Describe some intermediate packages: longtable, tabularx.
- Include The By Function. Mathew's Tutorial.
- - Controlling where your Graph apperas. H and float package
- Controlling the size of your Graph. width, height, and textwidth.
- Use graphicspath.
- - latex The table doesn't display exactly in the place I want to || What is the [H symbol](https://www.sharelatex.com/learn/Positioning_of_Figures) that appears besides the command "begin table"?

**graphicsx.** You can use this package to define the folder where all your graphics are stored. If you have been following the [Research Reproducibility organization](TBD) suggested, this will be the `figures` folder. To specify the figures directory, use the command `\graphicspath`, then within the brackets (note the beginning and ending brackets are repeated) include `./` which stands for your current working directory[^1]. Then, type the name of the folder where the figures are. Again, in the suggested organization the folder is `figures`. See the example below:

```latex
\documentclass{article}
\usepackage{graphicx}
\graphicspath{{./figures/}}
\begin{document}
```

[Up](#Contents)

[^1]: This command is compatible with Stata. Therefore, your working directory is the same you set with the Stata's commmand `cd`. Also, you can check out by typing `pwd` in the Stata Console.
