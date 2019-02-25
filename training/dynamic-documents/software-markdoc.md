---
title:
layout: contents
tag:
---

<a name="Contents"></a>
<p style="text-align: center;">
<a href="https://crenteriam.github.io/training/dynamic-documents/dynamicdocs-stata/">Dynamic Documents with Stata</a>
</p>
<p style="text-align: center;">
Software &rarr; <a href="#">Stata</a> - <a href="#">Latex</a> - <a href="#">Markdoc</a> - <a href="#">Markdown</a> - <a href="#">Text Editors</a>
</p>

### What is Markdoc?

[Markdoc](https://github.com/haghish/markdoc) "literate programming" package, which is a fancy slogan for creating your research document within a plain text editor. Markdoc is an add-on to expand the functionality of the Do-File Editor to become a text formatting editor and produces document outputs (e.g., html, latex, markdown, or Word). It is an Stata package created by E.F. Haghish and supports several markup languages, including Latex and Markdown.

### How does it work?

By using the contents printed in the console, and stored in your log file (.scml), markdoc creates a markup file (.tex, .md or html). Markdoc uses pandoc to export the .scml contents into any of the markup files mentined above. Therefore, your task is to make the Do-File readable as a Latex file.

Another way to see it is that markdoc makes your .do file bilingual, you are speaking Latex and Stata in the same file. The only rule is that you cannot be speaking both languages in the same programming line, and that you must tell Latex that you are switching languages.

You will always start speaking Stata, and then instruct Stata to switch to latex with `/***`, which can be read as: move from Latex to Stata. This command should be in a single line. When you finish typing in Latex, switch back to Stata with `***/`: move from Stata to Latex.

There are some nuances though
When workin in Stata, the console prints both the command line and the output. Often, you don´t want that to be printed in your screen.
- on off
- /**/ capture
- verbatim


### Installing Markdoc

To install markdoc first, you need to install the package `github`.[^1] Then, from the newly installed `github` package, use the command `github install` to install the `markdoc`, but make sure to install the version "3.8.0". Newer versions will automatically write some latex code for you, but will restrict your options on managing Latex.

- describe statax, weaver.

```stata
net install github, from("https://haghish.github.io/github/") replace
github install haghish/markdoc, version("3.8.0") replace
markdocpandoc // installs pandoc
ssc install statax
ssc install weaver
```

You may encounter an error that says [ado file already exists]. Yoy will need to manually delete that file. to do so, you need to find the folder where stata installs all user-written in ado/plus
- whats ado
- difference between base and plus

If you dont find the folder, you can type sysdir in the console and look for the path at the righ ot plus
[print screen below]

![print screen of sysdir]()

Download the practice Do-File [First Mardoc Practice](first-practice-markdoc.do)



[^1]: This is a package that allows you to install packages directly from github. The `github` and (the related) `git` packages are a great improvent for the Stata community. They expand the repositories available for developing and sharing user-written packages. Most importantly, version control platforms, like github, allow the users and developers to access all the versions of a package. In contrast, any update in the `ssc install` repository automatically replaces previous versions (so you can only install the latest version of a package.). See the [github package documentation](https://github.com/haghish/github).
