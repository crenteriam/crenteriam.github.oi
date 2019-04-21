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

Latex is a typesetting system to produce high-quality printing format document, as other word processors are. Latex operates under the principle of separating the production of contents from formatting its layout. As any Microsoft's Word user can notice, producing contents and formatting it occur at the same time That is the principle of what you see is what you get (WYSIWYG). In word processors is that formatting is a visual interaction that requires you to select the text and then choose the formatting though drop-down menus or shortcuts. Sometimes the word processor will automatically format or replace things for you. Word processors have embedded typesetting systems that apply "hidden formatting" information to control the page layout and text formatting.

In contrast, in Latex, authors provide formatting instructions through markup commmands independent of the contents, which gives the author *full control* of the typesetting and layout formatting. Latex puts youn in full control of the way your document will look, including margins, headers, footers, font type and size, sections, chapters, etc.  By full control we mean that there is nothing in the document that you didn't specifically asked for; full control also means placing figures at exactly  y-x coordinates in the page, speficying the width of the columns in a table, or automitizing the use of hollowed dots for every bullet point, etc.

The biggest value of word processors is the WYSIWYG and the user interphase. The biggest con is that all text formatting must be done, most of the times, by manually selecting the targeted text. The strongest point of text editors is that you have "full control" of everything is happening in your document. Another strong point is the automatization of formatting, which starts to prove its value when documents become bigger. In contrast, in text editors we have to write what is going to happen to the things we have written. A weak point is that ir requires programming skills, where not many feel confortable with. Further, Latex is one of the most awkward programming languages around; for highly formatted.

Benefits of Latex. So, in addition to the strenghts of text editors, we shall assess the strenghts and weaknesses of Latex. On the strengths side, Latex stands out for scienfic writting. The most evidente strenght is that is comparatively easier to handle math notation, but the best benefits are found in more mundane (but way more often) tasks. For example, adding metadata to figures and tables (title, table number, reference, notes, horizontal and vertical alignment, rotation), writing code chunks (snippets) that shows syntax highlighting, numbering of sections and subsections, and my very best favourite of all compiling a single file made up of several files (think about compiling a 6 chapter book, where you worked each chapter in a separate Word file).
-- other: easy referencing (anologous to working with Mendeley or Zotero in Word), easier handling of hyperreferences.
-- once you're advanced in Latex, it becomes unparalleled publishing quality mahcine (in fact, publishers use Latex rather than word). You get to formatting options that you can barely do in word processors.
-- [Latex is a very awkward](https://tex.stackexchange.com/questions/222500/why-is-latex-so-complicated)

A common question when introducing Latex is *why should I use Latex?* To be fair, there may be little things that you can do in Latex that you cannot in a word processor (and vice versa). Naturally, this is way in the grounds of subjectivity, but we believe that for begginers in Latex,  there is little that this system can add to your current work habits and productivity, simply because the most common word processors are all-round and robust softwares (that's the reason we all use them). This is emphasized in short documents (2-3 pages). Under those circunstances, Latex may be no other thing that a cool/annoying software to master, depending on your nerdyness. Latex beings to take off once you begin learning advanced markup synta in ways that cannot be matched by word processors. We can dedicate a whole section talking about it, but to keep it shortly, when developing large documentes, or with complicated formatting, or with repeated tasks, Latex will drastically reduce your time spent, formatting mismatches, or errors in contents (e.g., placing a Table in the wrong place or wrongly referencing a Figure).

To get started with Latex, you will need (1) a Latex distribution, and (2) a Text Editor. We will describe these two components in the next two subsections.

### Latex Distributions

 Latex distributions are installations of Latex along with complementary software for making it work better.[^1] (Equivalent to what the Anaconda distribution means to Python users).

 Latex is complicated language. We are warning you beforehand, Latex has an awkward programming syntax. The usual sin of more powerful programming languages are, such as C++, Fortran, and even HTML is that their syntax is awkward. On the other hand, the most user-friendly languages, tend to be more limited. Just comparethe history of Markdown versus its counterpart HTML. Markdown is a spin-off of HTML designed to be easy and intuitive for humans to read and write, but along with that, many utilities are sacrificed (even things such as underlining text). Latex is no different than the hard ones; it is perhaps the most powerful and versatile typesetting system and therefore it is also awkward at the beginning. But we believe that once you get used to the usual commands and debugging, its a pleasure to use.

 Most distributions and editors require that you install software on your computer. However, there are also several web- or browser-based interfaces that do not require you to install anything on your computer (e.g., Sharelatex). Installing software on your computer will often make it easier for you to access the software when you need it, and make it easier to control
 what you want to do. Whatever you choose, I encourage you to look for free, open-source options.

 The most common distribution for <u>Windows</u> is [MiKTeX](https://miktex.org/). [Protex](http://www.tug.org/protext/) is also a very good option that comes along with TexStudio. For Mac, we recommmend the [MacTeX](http://tug.org/mactex/) distribution and [TeXshop](https://pages.uoregon.edu/koch/texshop/) as TeX Editor. For Linux users, the [TeXLive](https://www.tug.org/texlive/) distributon. Some installations of MacTex and TeXLive will automatically install the Text Editor.

### Special Characters in Latex {#special}

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


[^1]: Talk about pdflatex, pdftex, xelatex, etc.
[^1]: See [comparison of TeX Editors](https://en.wikipedia.org/wiki/Comparison_of_TeX_editors).
[^2]: This image and the explanation is taken from [Dickimaw's website](https://www.dickimaw-books.com/latex/novices/html/commonerrors.html).
