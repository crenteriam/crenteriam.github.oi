---
title: Create and Store Graphics in Stata
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---
| [**Dynamic Documents with Stata.**](dynamicdocs-stata.md) Tools for Integrating Your Research Workflow |

<a name="Contents"></a>
<p style="text-align: center;">
 <a href="#">Previous section</a> &larr; Graphics &rarr; <a href="#">Next section</a>
</p>

### Create Graphics in Stata

First, load the data `auto`, run a scatterplot to compare `mpg` and `price`, and export it as a Portable Networks Graphics (.png) file in your folder `figures` (graph export can be read as "save as..."). We will name it `Graph1.png`.

```stata
sysuse auto
scatter mpg price
graph export ".\figures\Graph1.png", replace
graph close
```

### Store Graphics in Stata

### Manipulate Graphics in Stata

Required packages:
- Stata: none
- Latex: graphicx, caption, float.
- Controlling the appearance of your graph (Stata's commands, refer to section Graphics.)
- Present advanced features of graphics (interactions plot, coefficients plot, etc. ---which eventually would be in athe advanced chapter). An extra section with recommendations on visual display, based on tufte principles. A brief presentation of the principles.
- Graphs in Stata, advanced (colors, marker shape, graph combine, s2mono, twoway, etc.)
- stata How can I add a title to the table ||To manipulate the table numeration use the package [caption](https://tex.stackexchange.com/questions/28392/how-to-suppress-caption-numbering-in-a-table).
- How can I add more details ||For more fine-grained manipulation of estout tables, see
\href{https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm#summary}{this documentation}.
- Use Stata's labels to improve the readabilit of your variables \href{https://www.stata.com/manuals13/gsw9.pdf}{here}
(it's better is you do this in the data management do-file).
