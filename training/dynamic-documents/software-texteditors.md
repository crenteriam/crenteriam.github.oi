---
title:
layout: contents
tags:
---

<a name="Contents"></a>
<p style="text-align: center;">
<a href="https://crenteriam.github.io/training/dynamic-documents/dynamicdocs-stata/">Dynamic Documents with Stata</a>
</p>
<p style="text-align: center;">
Software &rarr; <a href="https://crenteriam.github.io/training/stata/stata/">Stata</a> - <a href="https://crenteriam.github.io/training/latex/latex/">Latex</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/software-markdoc/">Markdoc</a> - <a href="https://crenteriam.github.io/training/markdown/markdown/">Markdown</a>
</p>

### What is a Text Editor?

### Why does it Matter?

Why Latex matters:
- Suppose you sent to a journal and were rejected. Next step is sending to another journal. How much time would it take you to reformat.
- Suppose you decide to change the font type of all your titles...
- You are working with a very long report (+100 pages).
- Hadley: "If you are writing a scholarly paper or
a dissertation that incorporates data of any sort, and especially numerical data, a good text editor can make it easier to maintain control of things. Just as the actual numbers are crunched by your stats program—not your text editor—the typesetting of your paper is handled by a specialized application, too. at tool should automatically take care of things like entries in your bibliography, the labelling of tables and gures, and cross-references and other paraphernalia"
- In sum, they are a productivity tool that helps the researcher by taking care of some burdensome tasks (bibliography, citation style, fonts, layout, and most importantly accurate data in tables and figures, math writing). It's not that these don't exist elsewhere. Word processors have many of these integrated tools and work just fine for most people. But we (and many other people) feel that writing up your research through integrating tools (integrating the whole research process), improves quality and productivity, compared with a non-integrated approach (Stats Software + Word Processor).

### The Do-File Editor is a text editor

So the Do-File Editor is indeed an instance of plain text editors. As it is still (up to Version 15) conceived only for Stata language, the Do-File Editor does a decent job handling only Stata programming syntax. Even with Stata syntax, it lacks many features, such as autocompletion of programming code and interactive in-line docmentation, and a folder/file navigation bar.

When transitioning towards Dynamic Documents, you will be highly benefited from a text editor with syntax highlights for multiple languages, along with all the points mentioned below.

### Comparing Do-File Editor with others

A Text Editor is a software that produces some output by just typing plain text. For example, the Do-File processes data and makes calculations thorugh an, essentially, data filled with plain text. For Windows users, the classic example of a text editor is Microsoft notepad. That is a great example of plain text. But there are [plenty of text editors](https://en.wikipedia.org/wiki/List_of_text_editors), most of them are open source.

Text Editors contrast with rich text applications, such as word processors. In rich text applications, like Word, you can format and edit the text you are typing.

Latex, Markdown, and HTML are markup languages that will enrich the text visually represented in documents.

- [text editors vs word processors](http://ricardo.ecn.wfu.edu/~cottrell/wp.html)

Computing programmers develop software in text processors. Although most of the text editors are targeted for a software developing audience, the spread of programming statistics have seen the integration of statistics programming languages incorporated into the capabilities of text editors.

Two great text editors for working with Stata are Sublime Text and Atom. Atom it's build by the team at Github, and has nice featueres, not only for statistical programming and text processing, but also for collaboration and version control. Of course, there are the two classic text editors Emacs and Vim. Rstudio have developed its IDE into a text processing software, leveraging markdown for the .rmd file extension.

Overleaf deserves a worthy note...

Features of a good Text Editor (for use in statistical programming and text processing:)
- It's open source software. Not only the advantage of being *gratis*, and having your files usable across any platform and computer, but also because the community of users produce very useful add-ons.
- It is supported across several platforms (Windows, Mac or Linux)
- Supports multiple programming languages.
- Programming syntax highlighters.
- Autocompletion of programming code
- Troubleshooting tools
- Interactive inline documentation
- Will passively point out when you typed something wrong (sintactically) ["Lint, or a linter, is a tool that analyzes source code to flag programming errors, bugs, stylistic errors, and suspicious constructs"]




[Using Atom as a Latex Editor](https://medium.com/@lucasrebscher/using-atom-as-a-latex-editor-93756de3d726)
[markup language](https://en.wikipedia.org/wiki/Markup_language)

### Latex editors

A Latex Editor is simply a text editor specialized in Latex. By specializing in Latex, they are of much more help with autocompletion of Latex programming syntax, rendering previews of the document, and more importantly, when debugging errors. Most of the Latex Editors are a more friendly user interfase for writers (rather than programmers). In other words, they look more like Word (with buttons or shortcuts for italics, bold, bullet points, etc.) which, we think, is very, very welcomed for social science researchers. In summary, Latex Editors make using Latex a far less painful experience.

Here is a [list](https://beebom.com/best-latex-editors/) of polular Latex Editors: TeXworks (installed by default with the Miktex distribution), TeXmaker, TeXstudio, and teXlipse.

A notable mention are the cloud-based Latex Editors, such as overleaf (merged with the defunct ShareLatex) and Authorea. Cloud-based Latex Editors have many advantages, for example:

1. A repository of open source templates for any type of documents (templates for hundreds of scientific journals, dissertations, CVs, handouts, etc.).
2. Highly collaborative enviroments (Google Doc-like collaborative documents)
3. A strong version control system. In fact, you can integrate your documents with github, which enhances the collaborativeness and version control of your projects.
4. As the platforms have all distributions and packages in servers, you don't need to install anything. Therefore, any computer you use is ready for working in Latex (as long as you are connected to the Internet).


data -> editor (md, tex, do, r, rmd) -> document (html,rft,word, html, epub,pdf)
