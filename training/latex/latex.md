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

PAR the programming syntax
-- Note: it seems a pattern - the more powerful a programming language is (i.e. computing efficient and general purpose), the most ackward the programming syntax is. Take a look on the most powerful programming languages c++, fortran, and even html. On the other hand, the most user-friendly, the most limited. Compare Markdown with html.. Latex, in our opinion, fall among the most powerful markup language, and therefore is are really awckward typesetting tool at the beginning.

PAR - what is documentclass and what options do i have
- what is being document, what do you begin and end
- https://www.youtube.com/watch?v=Y-kXtWdjtmw

Every Latex file starts with the command `\documentclass{}`, which specifies the type of document that will be rendered. The most common options are `article`, `report`, `memoir`, and `beamer`. For the whole book, we will only use `article`.

```latex
\command[options]{target}
```
The chunk below shows a very simple example of a Latex document. In this example, we are using an `article` type of document and defined the font size as `[12pt]`. For a visual example of this code running, watch the video [Learn Latex in 5 minutes](https://www.youtube.com/watch?v=Y-kXtWdjtmw) or [this if you are using Mac](https://www.youtube.com/watch?v=qFfZT8R5Tds&index=2&list=PLHRAARhM2yAwbJfd71VpqpvNzkBYEBSzt).

[video abstract, footnotes etc](https://www.youtube.com/watch?v=JtmEhKGSvak&list=PLHRAARhM2yAwbJfd71VpqpvNzkBYEBSzt&index=5)

```latex
\documentclass[12pt]{article}
% Preamble Section.
% Everything by the left side of % are comments
\begin{document}
Body of the Document. This test will be printed.
% Body of the document
% Comments within the body of the document. Will not be printed.
\end{document}
```
### Getting Started

To get started, you need to have installed:

1. A tex distribution
2. Text editor

Most distributions and editors require that you install software on your computer. However, there are also several web- or browser-based interfaces that do not require you to install anything on your computer (e.g., Sharelatex). Installing software on your computer will often make it easier for you to access the software when you need it, and make it easier to control
what you want to do. Whatever you choose, I encourage you to look for free, open-source options.

Watch the video [Starting a Report and Title Page](https://www.youtube.com/watch?v=7HC9xEZsqdM) to see how to help yourself making your first report (one that includes title, author, and sections).

Alexander Baran-Harper have put on YouTube a nice, short and complete series of videos of [Latex Report Writing Tutorials](https://www.youtube.com/watch?v=FXujG7c9p8g&list=PLNnwglGGYoTtW7o4PHFOSWGevcdFa3v3D). These videos go over all you need to know about Latex for this book.

<u>Tex Distribution:</u>

The most common distribution for <u>Windows</u> is [MiKTeX](https://miktex.org/). [Protex](http://www.tug.org/protext/) is also a very good option that comes along with TexStudio. For Mac, we recommmend the [MacTeX](http://tug.org/mactex/) distribution and [TeXshop](https://pages.uoregon.edu/koch/texshop/) as TeX Editor. For Linux users, the [TeXLive](https://www.tug.org/texlive/) distributon. Some installations of MacTex and TeXLive will automatically install the Text Editor.

For <u>Text Editors</u> see section [Text Editors]().
- TeX Editors.[^1]
- The cloud service Overleaf is a great alternative.
- watcxh this video for seing a latex editor running [x](https://www.youtube.com/watch?v=SoDv0qhyysQ&index=1&list=PLTejunv6WZfG-b9a0o0OcVMRpIJIlcHhF)

```latex
\documentclass{article}
\begin{document}
This text will be printed in the body of the document.
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

### Errors and Debugging in Latex

Writing in Latex is a pain, specially because the errors are hard to catch (specially the simplest ones). Just to give you a sense, this is a [thread that one experienced programmer](https://tex.stackexchange.com/questions/309010/teach-me-to-debug) started in stackexchange about debugging:

> Ok, 35 years of programming has not prepared me to debug tex errors. It's painful.

So, the basics for reading the errors is displayed in the image below.[^2] First, the type of error is displayed after the `!` symbol. In the image below, the error is "undefined control sequence" (God knows...). At the beginning of the next line, after the `l.` you will see the line number (the Latex line, not the line shown in the Do-File editor). To check out the Latex line, by opening up the `.tex` file. Then, the error is displayed at the end of the line, in the case below is `\toady`, which we can clearly see is about a typo (must be `\today`).

![Reading errors](../../files/debugging/latex-readerrors.png)

It also worths checking Dickimaw's explanation about [common drrors](https://www.dickimaw-books.com/latex/novices/html/commonerrors.html), and [Latex for Complete Novices](https://www.dickimaw-books.com/latex/novices/). The stackexchange thread [teach me to debug](https://tex.stackexchange.com/questions/309010/teach-me-to-debug), and the file [art of problem solving](https://www.tug.org/TUGboat/tb26-1/schwartz.pdf).

Troubleshooting is one of the most time-consuming parts of learning compiling dynamic documents, specially in Latex. The best way to (avoid and) solve troubles is by using text editors. As explained in [Chapter X](), the Do-File Editor is very limited compared to others, and it is specially unhelpful for troubleshooting.

The best troubleshooting alternatives are Overleaf, TexStudio. These are specialized text editors in Latex and will provide you the line with the problem and a concrete explanation. They also will automatically flag elementary problems, such as a closing `}` missing or things like that.

Other ways to avoid troubleshooting in both Stata and Latex, is by writing your Do-Files from third party text editors. Recommended Atom and Sublime Texts. Old-School, highly robust alternatives are Vim and Emacs.

### Bugs. Greatest Hits.
The key problem is that the Latex error messages are kind of meaningless for human reading. To help making sense of that, here is our list of Greatest Bug Hits. Make sure you can read all of these error messages and you will be done with about 90% of the errors you will come across.

<center>
Missing a closing curly bracket.
Error message: Paragraph ended before \\begin was complete.
</center>
![Missing curly bracket](../../files/debugging/latex-missingbracket.png)

<center>
Missing (or wrong) closing an environment.
</center>

Read the error: the environment center that was begun at line 6, was ended until \\end{document} in line 10, which is clearly not the proper ending environment.

![Missing Wrong Environment](../../files/debugging/latex-missingwrongendenvironment.png)

<center>
Missing a Package
</center>

![Missing Package](../../files/debugging/latex-missingpackage.png)

<center>
Forgetting using the escape command "\\" with special Characters
</center>

![Special Characters](../../files/debugging/latex-amp.png)
![Special Characters](../../files/debugging/latex-backslash.png)
![Special Characters](../../files/debugging/latex-dollar.png)
![Special Characters](../../files/debugging/latex-hash.png)
![Special Characters](../../files/debugging/latex-underscore.png)

<center>
Mispelled or wrong environment
</center>

![Wrong Environment](../../files/debugging/latex-wrongenvironment.png)

<center>
Non-existing file
</center>
![Nonexisting file](../../files/debugging/latex-nonexistingfile.png)

<center>
Forgot to insert \\end{document}
Note: it doesn't even shows an error. Stops before running the preamble and body parts of Latex.
</center>
![Nonexisting file](../../files/debugging/latex-noendocument.png)

<center>
Repeated \\documentclass (or repeated a command that must not be repeated)
Note: if you installed one of the newest versions of markdoc you may encounter this problem because markdoc is going to write some Latex code without telling you.
</center>
![Nonexisting file](../../files/debugging/latex-documentclass.png)

### Special Characters

This is very, very important as it is the most common bugs for novices. There are some "reserved" characters that Latex uses as commands for executing some markup. The special characters are:

- \ : used to define the beginning of a command. For example, \input{}. It is also an "escape" symbol.
- $ : used to mark the beginning of Math notation. When using it, you must use a second dollar sign to mark the end of Math notation.
- % : used to beginn comment text (same as * or // in Stata).
- {} : it has a couple of functions, mostly grouping characters for applying the same command (see the example of using underscore right below
- _ : used to write underscript. For example the molecular formula of water would be H_{2}O. The {} symbols help applying the underscript only to the symbol 2, and not extend it to the symbol O. Underscripts and upperscripts must be used within the Math notation command (the dollar symbols explained above).
- ^ : used to write upperscripts with the same logics as underscripts.
- \# : Used as macro parameter

To print any of these symbols in your document, you must use the "escape" symbol "\". For example, if you want to write use the dollar symbol for actually talking about dollars, then you must type in the text:

```latex
The financial report that came yesterday shows that the company Matt \& Cesar Co. had a yearly profit of \$165,000, which represents a 25\%.
```

### References
- [Overleaf Documentation](https://www.overleaf.com/learn)
- [Latex Wikibook](https://en.wikibooks.org/wiki/LaTeX)
- [The Not So Short Introduction to Latex](http://mirrors.rit.edu/CTAN/info/lshort/english/lshort-letter.pdf)
- http://math.hws.edu/gassert/LaTeX_Guide_Title.pdf
- https://www.deleidscheflesch.nl/assets/uploads/2017/09/instructions.pdf
- http://www.docs.is.ed.ac.uk/skills/documents/3722/3722-2014.pdf
- https://upload.wikimedia.org/wikipedia/commons/2/2d/LaTeX.pdf

[^1]: See [comparison of TeX Editors](https://en.wikipedia.org/wiki/Comparison_of_TeX_editors).
[^2]: This image and the explanation is taken from [Dickimaw's website](https://www.dickimaw-books.com/latex/novices/html/commonerrors.html).
