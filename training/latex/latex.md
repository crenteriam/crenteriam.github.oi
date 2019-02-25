---
title: Latex
layout: contents
---

<a name="Contents"></a>
<p style="text-align: center;">
<a href="https://crenteriam.github.io/training/dynamic-documents/dynamicdocs-stata/">Dynamic Documents with Stata</a>
</p>
<p style="text-align: center;">
Software &rarr; <a href="#">Stata</a> - <a href="#">Latex</a> - <a href="#">Markdoc</a> - <a href="#">Markdown</a> - <a href="#">Text Editors</a>
</p>

### Introducing Latex

Latex is a typesetting system. As Python or R are programming languages designed to compute calculations, Latex is a programming language to compute typesetting. This means that Latex allows you to control the way your documents appear, including margins, headers, footers, font, sections and chapters, and other formatting issues.

PAR Typesetting sytem vs Word Processor

PAR To use Latex, you need both a Latex distribution and a Text Editor. Tex distributions are the collection of software and other tools that make Latex work.

PAR Tex editors – that is, software that enables you to enter and edit your text along with LATEX commands – are the front-end interface that allow you to communicate with your Latex distribution. These programs are powerful text editors and typesetting tools that allow you to create and customize documents. The best editors are also contain efficiency and productivity tools like spell check, auto-completion, and prompts that help you remember the proper commands and formatting for LATEX syntax.

PAR Compiling. What is. Creating a viewable or printable document in its final format requires running the tex editor, that is, telling the tex editor to process the text and formatting commands you have entered. This is called “compiling”.

PAR the grammar

PAR - what is documentclass and what options do i have
- what is being document, what do you begin and end
- https://www.youtube.com/watch?v=Y-kXtWdjtmw

```latex
\command[options]{target}
```

```latex
\documentclass[12pt]{target}
% Preamble Section.
% Everything by the left side of % are comments
\begin{document}
Body of the Document. This test will be printed.
% Comments within the body of the document. Will not be printed.
\end{document}
```

### Getting Started

To get started, you need to have installed:

1. A tex distribution
2. Text editor

Most distributions and editors require that you install software on your computer. However, there are also several web- or browser-based interfaces that do not require you to install anything on your computer (e.g., Sharelatex). Installing software on your computer will often make it easier for you to access the software when you need it, and make it easier to control
what you want to do. Whatever you choose, I encourage you to look for free, open-source options.

<u>Tex Distribution:</u>

The most common distribution for <u>Windows</u> is [MiKTeX](https://miktex.org/). [Protex](http://www.tug.org/protext/) is also a very good option that comes along with TexStudio. For Mac, we recommmend the [MacTeX](http://tug.org/mactex/) distribution and [TeXshop](https://pages.uoregon.edu/koch/texshop/) as TeX Editor. For Linux users, the [TeXLive](https://www.tug.org/texlive/) distributon. Some installations of MacTex and TeXLive will automatically install the Text Editor.

For <u>Text Editors</u> see section [Text Editors]().
- TeX Editors.[^1]

- The cloud service Overleaf is a great alternative.

```latex
\documentclass{article}
\begin{document}
Printed text in the document.
\end{document}
```

### Compiling a Latex File

### Main Packages and commands

PAR.

| Package      | Description       |
| ---          | ---               |
| float        |                   |
| graphicsx    |                   |
| Geometry     |                   |
| hyperref     |                   |
| comment      |                   |
| longtable    |                   |
| tabularx     |                   |

- Quotation Mark

| Command      | Description       |
| ---          | ---               |
section, caption, begin figure and table, input, title, date, today, author, maketitle,
textit, textbold,.

### Troubleshooting Latex

Troubleshooting is one of the most time-consuming parts of learning compiling dynamic documents, specially in Latex. The best way to (avoid and) solve troubles is by using text editors. As explained in [Chapter X](), the Do-File Editor is very limited compared to others, and it is specially unhelpful for troubleshooting.

The best troubleshooting alternatives are Overleaf, TexStudio. These are specialized text editors in Latex and will provide you the line with the problem and a concrete explanation. They also will automatically flag elementary problems, such as a closing `}` missing or things like that.

Other ways to avoid troubleshooting in both Stata and Latex, is by writing your Do-Files from third party text editors. Recommended Atom and Sublime Texts. Old-School, highly robust alternatives are Vim and Emacs.


### Videos
https://www.youtube.com/watch?v=7HC9xEZsqdM
https://www.youtube.com/watch?v=SoDv0qhyysQ&list=PLTejunv6WZfG-b9a0o0OcVMRpIJIlcHhF

### References
- [Overleaf Documentation](https://www.overleaf.com/learn)
- [Latex Wikibook](https://en.wikibooks.org/wiki/LaTeX)
- [The Not So Short Introduction to Latex](http://mirrors.rit.edu/CTAN/info/lshort/english/lshort-letter.pdf)
- http://math.hws.edu/gassert/LaTeX_Guide_Title.pdf
- https://www.deleidscheflesch.nl/assets/uploads/2017/09/instructions.pdf
- http://www.docs.is.ed.ac.uk/skills/documents/3722/3722-2014.pdf
- https://upload.wikimedia.org/wikipedia/commons/2/2d/LaTeX.pdf

[^1]: See [comparison of TeX Editors](https://en.wikipedia.org/wiki/Comparison_of_TeX_editors).
