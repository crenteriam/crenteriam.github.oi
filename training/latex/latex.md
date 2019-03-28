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

Latex is a typesetting system that uses TeX as its formatting engine TeX. Latex enables writers to produce a high-quality document for printing. The authors provide formatting instructions in plain text through markup syntax. Latex puts youn in full control of the way your document will look, including margins, headers, footers, font type and size, sections, chapters, etc. For begginer and intermediate users, there is not much difference between what you can achieve with a word processor (e.g., Microsoft Word) and Latex, but for and advanced user the formatting cannot be matched by word processors.

To get started with Latex, you will need (1) a Latex distribution, and (2) a Text Editor. Latex distributions are collections of software and other tools that make Latex work smoothly (similar to Anaconda distribution for Python users). Text Editors are software for working with plain text. They are the user interface for writing and formatting documents with your Latex distribution. Usually, Text Editors are general purpose softwares for programming. The best editors are also contain efficiency and productivity tools like spell check, auto-completion, etc. There are some specialized Text Editors for Latex typesetting with syntax highlights and other prompts that help you remember the proper Latex commands and formatting syntax.

We are warning you beforehand, Latex has an awkward programming syntax. The usual sin of more powerful programming languages are, such as C++, Fortran, and even HTML is that their syntax is awkward. On the other hand, the most user-friendly languages, tend to be more limited. Just comparethe history of Markdown versus its counterpart HTML. Markdown is a spin-off of HTML designed to be easy and intuitive for humans to read and write, but along with that, many utilities are sacrificed (even things such as underlining text). Latex is no different than the hard ones; it is perhaps the most powerful and versatile typesetting system and therefore it is also awkward at the beginning. But we believe that once you get used to the usual commands and debugging, its a pleasure to use.

### Latex vs Word Processors
PAR Typesetting sytem vs Word Processor. % Text editor
A text editor is a software for working with plain text. Perhaps the most known and used text editors are the Windows' Notepad and Mac's TextEdit. The main feature of text editors is just that, you only see plain text. Any text markup (i.e. formatting, like alignment, font face or size, bolding or italicizing) must be written in plain text as well.

In contrast to text editors, a word processor is a software for working with text that can be formatted and prepared for printing (or publishing in digital media). Word processors have embedded typesetting systems that apply "hidden formatting" information to control the page layout and text formatting. The most common characteristic of word processors is that formatting is a visual interaction that requires you to select the text and then choose the formatting though drop-down menus or shortcuts. Sometimes the word processor will automatically format or replace things for you. Therefore, on a word processor what you see is what you get (WYSIWYG). Full control also means full precission that is hard to get in word processors, like placing some figures at exacly x coordinates in the page, or exactly controlling the width of the columns in a table (other examples). A second strenght is automatization ...

Let's compare text editors and word processors. The biggest value of word processors is the WYSIWYG and the user interphase. The biggest con is that all text formatting must be done, most of the times, by manually selecting the targeted text. The strongest point of text editors is that you have "full control" of everything is happening in your document. Another strong point is the automatization of formatting, which starts to prove its value when documents become bigger. In contrast, in text editors we have to write what is going to happen to the things we have written

A weak point is that ir requires programming skills, where not many feel confortable with. Further, Latex is one of the most awkward programming languages around; for highly formatted.

Remember we care about text editors because we will use Latex (precisely, the TeX programming language) through a text editor. So, in addition to the strenghts of text editors, we shall assess the strenghts and weaknesses of Latex. On the strengths side, Latex stands out for scienfic writting. The most evidente strenght is that is comparatively easier to handle math notation, but the best benefits are found in more mundane (but way more often) tasks. For example, adding metadata to figures and tables (title, table number, reference, notes, horizontal and vertical alignment, rotation), writing code chunks (snippets) that shows syntax highlighting, numbering of sections and subsections, and my very best favourite of all compiling a single file made up of several files (think about compiling a 6 chapter book, where you worked each chapter in a separate Word file).
-- other: easy referencing (anologous to working with Mendeley or Zotero in Word), easier handling of hyperreferences.
-- once you're advanced in Latex, it becomes unparalleled publishing quality mahcine (in fact, publishers use Latex rather than word). You get to formatting options that you can barely do in word processors.
-- [Latex is a very awkward](https://tex.stackexchange.com/questions/222500/why-is-latex-so-complicated)



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

PAR Compiling. What is. Creating a viewable or printable document in its final format requires running the tex editor, that is, telling the tex editor to process the text and formatting commands you have entered. This is called “compiling”.

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

### Special Characters {#special}

This is very, very important as it is the most common bugs for novices. There are some "reserved" characters that Latex uses as commands for executing some markup. The special characters are:

- **\** : used to define the beginning of a command. For example, \input{}. It is also an "escape" symbol. If you want to print an actual backslash, then you must use the command `\backslash`.
- **$** : used to mark the beginning of Math notation. When using it, you must use a second dollar sign to mark the end of Math notation.
- **%** : used to beginn comment text (same as * or // in Stata).
- **{}** : it has a couple of functions, mostly grouping characters for applying the same command (see the example of using underscore right below
- **_** : used to write underscript. For example the molecular formula of water would be H_{2}O. The {} symbols help applying the underscript only to the symbol 2, and not extend it to the symbol O. Underscripts and upperscripts must be used within the Math notation command (the dollar symbols explained above).
- **^** : used to write upperscripts with the same logics as underscripts.
- **\#** : Used as macro parameter
- **~** : another special character.

To print any of these symbols in your document, you must use the "escape" symbol "\". For example, if you want to write use the dollar symbol for actually talking about dollars, then you must type in the text:

```latex
The financial report that came yesterday shows that the company Renteria \& Ingram Co. had a yearly profit of \$165,000, which represents a 25\%.
```

Several ways to add vertical space: `\par` initiate a new paragraph. `\vspace{}` add vertical space (within curly brackets specify the space in inches; centimeters or points); `\smallskip`, `\medskip`, `\bigskip` all three add built-in vertical skips with different lenght; `//` equivalent to hit enter in Word.

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
