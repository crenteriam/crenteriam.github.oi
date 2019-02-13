---
title: Graphics
layout: contents
tag: dynamic documents, stata, research workflow, research reproducibility, reproducible research, social sciences
---
| **Dynamic Documents with Stata.** Tools for Integrating Your Research Workflow |

<a name="Contents"></a>
[Teaching](../../../teaching) &rarr; [Dynamic Documents with Stata](../dynamicdocs-stata)  &rarr; Graphics

PAR1. This chapter will guide in creating figures in Stata, storing them into your project working directory and link them into your dynamic document.

Subsections:
- Create the figure
  - Manipulate figures in Stata
- Store it
- Link to the dynamic documents
  - manipulate figures in Latex

TODO:
- Present advanced features of graphics (interactions plot, coefficients plot, etc. ---which eventually would be in athe advanced chapter). An extra section with recommendations on visual display, based on tufte principles. A brief presentation of the principles.
- Graphs in Stata, advanced (colors, marker shape, graph combine, s2mono, twoway, etc.)
- Reporting Descriptive Statistics and Regression outputs.
- Describe the two environments (figure and table). Describe basic logics of both (include tabular and longtable). Describe the H, h and h!.
Describe the basic packages: capton, float, graphicx.
Describe some intermediate packages: longtable, tabularx.
- Include The By Function. Mathew's Tutorial.

### Frequent troubles
- The table doesn't display exactly in the place I want to || What is the [H symbol](https://www.sharelatex.com/learn/Positioning_of_Figures) that appears besides the command "begin table"?
- How can I add a title to the table ||To manipulate the table numeration use the package [caption](https://tex.stackexchange.com/questions/28392/how-to-suppress-caption-numbering-in-a-table).
- How can I add more details ||For more fine-grained manipulation of estout tables, see
\href{https://www.ssc.wisc.edu/sscc/pubs/stata_tables.htm#summary}{this documentation}.
- Use Stata's labels to improve the readabilit of your variables \href{https://www.stata.com/manuals13/gsw9.pdf}{here}
(it's better is you do this in the data management do-file).
- You can check out the companion do-file of this document on blackboard.
- My table doesn't fit the page. How can I [solve it?](https://tex.stackexchange.com/questions/10535/how-to-force-a-table-into-page-width)
