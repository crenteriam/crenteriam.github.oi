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

### Installing Markdoc

To install markdoc first, you need to install the package `github`.[^1] Then, from the newly installed `github` package, use the command `github install` to install the `markdoc`, but make sure to install the version "3.8.0". Newer versions will automatically write some latex code for you, but will restrict your options on managing Latex.

You must install two more packages. [**Statax**](https://github.com/haghish/statax) and []**Weeaver**](https://github.com/haghish/weaver) are markup syntax highlighters. They are supportive packages for rentering the markup syntax in the dynamic documents.

```stata
net install github, from("https://haghish.github.io/github/") replace
github install haghish/markdoc, version("3.8.0") replace
markdocpandoc // installs pandoc
ssc install statax, replace
ssc install weaver, replace
```

You may encounter an error that says that the `.ado` file already exists. To fix it, make sure you are using the option `replace` as indicated in the chunk code above.

[Up](#Contents)

### How does it work?

By using the contents printed in the console, and stored in your log file (.scml), markdoc creates a markup file (.tex, .md or html). Markdoc uses pandoc to export the .scml contents into any of the markup files mentined above. Therefore, your task is to make the Do-File readable as a Latex file.

Another way to see it is that markdoc makes your .do file bilingual, you are speaking Latex and Stata in the same file. The only rule is that you cannot be speaking both languages in the same programming line, and that you must tell Latex that you are switching languages.

You will always start speaking Stata, and then instruct Stata to switch to latex with `/***`, which can be read as: move from Latex to Stata. This command should be in a single line. When you finish typing in Latex, switch back to Stata with `***/`: move from Stata to Latex.

Remember that what you see in the log file is what will be rendered as a markup document (`.tex`, `.md` or `html`). And this has some very important nuances. The log file records what is being printed in the console, which is both the *programming line* and the *output*. Often, we don't want any of them to be printed. To hide the *programming line* from the log file, use `/**/` before the programming line. To hide the *output*, use `quietly` before the programming line, and to hide both, combine them: `/**/ quietly`. See the chung below:

```stata
* The line below will only hide the programming line
/**/ display "markdoc is a literate programming package"

* The line below will only hide the output
quietly display "markdoc is a literate programming package"

* The line below will hide the programming line AND the output
/**/ quietly display "markdoc is a literate programming package"
```

This procedure may be annoying when trying to hide whole chunks from both the *programming line* and the *output* (which is a common situation). There is a shortcut for that. Use `//OFF` to start hiding both the programming line and the output and start writing Stata code in the Do-File. This command will stop recording anything in the log file. When finishing writing Stata code, insert on `//ON` to enable again recording in your log file. For example:

```stata
* The command below will be recorded in the log file
sysuse auto

//OFF
* everything typed below //OFF will be executed in the console
* but not recorded in the log file
scatter mpg price
graph export "graph1.png"
//ON

* After //ON, the lines below will be recorded in the log file
display "markdoc is a literate programming package"
```

Finally, sometimes you may want to pring some stata output directly in your dynamic document. For example, a summary statistics table. Printing Stata's output may generate problems to Latex, for example, the underscore---commonly used in variable names (e.g., `avg_age_2004`)---will yield an error in Latex, because the [underscore is a command](TBD). Therefore, you may want to use the Latex command `verbatim` to play safe.

Line by line, the chunk below switches from Latex to Stata, and back to Latex, and reads as: `\begin{verbatim}` begin reading the following as non-Latex text; `***/` switch from Latex to Stata; write some stata code; `/***` switch back from Stata to Latex; `\end{verbatim}` start reading again the next lines as Latex text. It may be awkward at the beginning, but little by little it will become natural to you.

```latex
\begin{verbatim}
***/
sysuse auto
summarize mpg price
/***
\end{verbatim}
```

Download the practice Do-File [First Practice Mardoc](https://crenteriam.github.io/training/files/tutorials/first-practice-markdoc.do)

[Up](#Contents)

[^1]: This is a package that allows you to install packages directly from github. The `github` and (the related) `git` packages are a great improvent for the Stata community. They expand the repositories available for developing and sharing user-written packages. Most importantly, version control platforms, like github, allow the users and developers to access all the versions of a package. In contrast, any update in the `ssc install` repository automatically replaces previous versions (so you can only install the latest version of a package.). See the [github package documentation](https://github.com/haghish/github).
