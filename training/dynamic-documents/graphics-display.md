---
title: Display Graphics in your Latex Document
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---
| **Dynamic Documents with Stata.** Tools for Integrating Your Research Workflow |

<a name="Contents"></a>
[Teaching](../../../teaching) &rarr; [Dynamic Documents with Stata](../dynamicdocs-stata)  &rarr; [Graphics](../graphics) &rarr; Display Graphics in your Latex Document


Required packages:
- Stata: none
- Latex: graphicx, caption, float.


For inserting a graph in your \LaTeX\ document, you don't need to install any package on Stata, but you will need the package \verb|graphicx| in the \LaTeX\ environment. Load the package by using the command \verb|usepackage| after the command \verb|documentclass|, but before the command \verb|begin{document}|. In this section, you must also define the folder where Stata will store your figures. Use the command \verb|graphicspath| and use \verb|./| (the latter refers to the working directory). Then, type the name of the folder where the figures are. In this case is \verb|figures|. See the example below:

```latex
\begin{Verbatim}[gobble=1]
%\documentclass[letter,12pt]{article}
%\usepackage[english]{babel}
%\usepackage{graphicx}
%\graphicspath{{./figures/}}
%\begin{document}
\end{Verbatim}
```

First, load the data `auto`, run a scatterplot to compare `mpg` and `price`, and export it as a Portable Networks Graphics (.png) file in your folder `figures` (graph export can be read as "save as..."). We will name it `Graph1.png`.

```latex
\begin{Verbatim}[formatcom=\color{stata}]
sysuse auto
scatter mpg price
graph export ".\figures\Graph1.png", replace
graph close
\end{Verbatim}
```

The graph is now saved as a .png file in the folder `figures`. Next, we need to call the file in the Latex document by beginning an object type `figure` (see first line below).
The next line is `centering` the object. Centering means that the figure will be centered in the page.
The next line, `includegraphics`, tells Latex to display the graph named `Graph1.png` (the name of the file `Graph1.png` is in curly braces). Within the brackets, you can define many features for the figure. In this case, we defined the width as 4.5 inches, and height as 3 inches.
The command `caption` is used to title and number the graph.

```latex
\begin{Verbatim}[label=Print a Figure in \LaTeX,formatcom=\color{latex}]
\begin{figure}[h]
\centering
\includegraphics[width=4.5in,height=3in]{Graph1.png}
\caption{Scatterplot - mpg and price}
\end{figure}
\end{Verbatim}
```

This is how the Graph will be displayed:

![Display Graph Here](Ancillary/Graphics/04_01_G1.png)

### Advanced Stuff

- Controlling where your Graph apperas. H and float package
- Controlling the size of your Graph. width, height, and textwidth.
- Use graphicspath.
- Controlling the appearance of your graph (Stata's commands, refer to section Graphics.)
