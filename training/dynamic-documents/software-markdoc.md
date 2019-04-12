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
Software &rarr; <a href="https://crenteriam.github.io/training/stata/stata/">Stata</a> - <a href="https://crenteriam.github.io/training/latex/latex/">Latex</a> - <a href="https://crenteriam.github.io/training/markdown/markdown/">Markdown</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/software-texteditors/">Text Editors</a>
</p>

### What is Markdoc?

[Markdoc](https://github.com/haghish/markdoc) is marketed as a "literate programming" package, which is a fancy way to say it's a tool for creating dynamic documents within the Do-File Editor. Markdoc expands the functionality of the Do-File Editor, making it a text formatting editor capable of producing markup-based documents (e.g., html, pdf or Word).

Markdoc uses `pandoc` to render the contents stored in the Log File (extension `.scml`) into Markdown, Latex or HTML markup languages (extensions `.md`, `.tex`, and `html`). When we are writing into the Do-File, however, we will interweave Latex and Stata programming. In other words, we will have a bilingual Do-File. Through a combination of Markdoc commands (that we will review below), we will use both languages in the same file to produce the dynamic document. The only rules are (Quite obvious): (1) we cannot speak both languages in the same programming line, and (2) we must instruct Stata to switch between Stata and Latex languages by using Markdoc commands.

In the next subsections, we will first review how to install markdoc in Stata. Then, we will review hoe to use Markdoc in Stata.

### Installing Markdoc

To install markdoc first, you need to install the package `github`.[^1] Then, from the newly installed `github` package, use the command `github install` to install the `markdoc`, but make sure to install the version "3.8.0". Newer versions will automatically write some latex code for you, but will restrict your options on managing Latex.

You must install two more packages. [**Statax**](https://github.com/haghish/statax) and [**Weaver**](https://github.com/haghish/weaver) are markup syntax highlighters. They are supportive packages for rentering the markup syntax in the dynamic documents. `markdocpandoc` is an userwritten command within the `markdoc` package that installs some pandoc features (see [sub-section "others"](software-markdoc.md)). This will help you export your dynamic document into several formats.

```stata
net install github, from("https://haghish.github.io/github/") replace
github install haghish/markdoc, version("3.8.0") replace
markdocpandoc // installs pandoc
ssc install statax, replace
ssc install weaver, replace
```

You may encounter an error that says that the `.ado` file already exists. To fix it, make sure you are using the option `replace` as indicated in the chunk code above.

[Up](#Contents)

### Using Markdoc

following the bilingual methapor, we will start speaking Stata in the Do-File by default. First, we will lay down the traditional environment setup, and then we will create a Log File. As explained above, the Log File is absolutly crucial when working with Markdoc, since this is the file that Markdoc is going to use as input to render the `.tex` file. The chunk below shows the beginning of a dynamic document using Markdoc. Note that before creating the Log File, we are using the line `capture log close _all`. This line tells Stata to close any running Log File before creating our the file `MyLog.scml`. (it is common that log files keep open when re-running Do-Files). The command `capture` will help aviding an error if there is not a Log File needed to be closed. When creating the `MyLog.scml` is important to use the command `quietly` to avoid having the output of that command printed in your `.tex` file.

```stata
* Environment setup
clear all
set more off
version 15

* Working directory
cd "C:/Workingdirectory"
mkdir data
mkdir data/original
mkdir data/working
mkdir code
mkdir figures
mkdir tables

* Start Log File
capture log close _all
quietly log MyLog, replace
```
Once the Log File is running, the most important step is to switch back and forth between Stata and Latex. To switch from stata language to Latex use the Markdoc command `/***` (imagine that the slash means "Stata" and the three stars mean "Latex"). Once you typed these characters in a single line, you are in Latex language. To switch back from Latex to Stata, use the Markdoc command `***/`. See the chunk below:

```stata
* Begin in Stata
capture log close _all
quielty log using MyLog, replace

* The line below switches from Stata to Latex language
/***
% Now I am writing in Latex language (the sign % is to comment out, equivalent to the star in Stata)
% In the lines below, I will create a basic Latex document.
\documentclass{article}
\begin{document}
Text in the Document.
\end{document}
% Switch back from Latex to Stata
***/
* Now I am in Stata again
log close
markdoc MyLog, export(tex) markup(tex)
```
Remember that what is being recorded in the Log File is what will be rendered as a Markup document (`.tex`, `.md` or `html`). That's why in the last line from the chunk above, we use the Markdoc command `markdoc` to render the `.scml` file in to a `.tex` file.

Is important to note that the Log File will record every Stata's *programming line* (except the comments) and its correspoding *output*---or what you see printed in the console. Often, we don't want any of them to be printed. To hide the *programming line* from the log file, use `/**/` before the programming line. To hide the *output*, use `quietly` before the programming line, and to hide both, combine them: `/**/ quietly`. See the chung below:

```stata
* The line below will only hide the programming line
/**/ display "markdoc is a literate programming package"

* The line below will only hide the output
quietly display "markdoc is a literate programming package"

* The line below will hide the programming line AND the output
/**/ quietly display "markdoc is a literate programming package"
```

Alternatively, you can just simply use the markdoc command `//OFF` in the Stata language mode to stop recording in the Log File anything being executed in the console, and later use `//ON` to resume recording in the Log File. For example:

```stata
* The command below will be recorded in the log file
sysuse auto

//OFF
* everything typed below //OFF will be executed in the console
* but not recorded in the log file
scatter mpg price
graph export "graph1.png", replace
//ON

* After //ON, the lines below will be recorded in the log file
display "markdoc is a literate programming package"
```

Sometimes it is necessary to print Stata output directly on the dynamic document. For example, printing short summary table or a list of few observations. The first step is keep recording in the Log File; in other word, do not use `//OFF` nor `//ON` or their equivalents. But printing Stata's output in a Latex document is problematic for two reasons. First, because Latex is going to render the Stata's characters into a Latex typesetting, and will make, for example, a Stata's text table appear in lines as regular text. Second, because some Stata's tables will come with Latex's special characters and will cause an error. This problem is common with variable names, which usually have an underscore---remember that the underscore is a special character in Latex. To avoid both problems, you must use the Latex environment `verbatim`.

The Latex environment `verbatim` will read any string of character as it is, and will not try to render it into the Latex typesetting. The chunk below uses the environment `verbatim` and switches from Latex to Stata, and back to Latex. It can be read: `\begin{verbatim}` begin printing the following text without Latex typesetting; `***/` switch from Latex to Stata; write some Stata code; `/***` switch back from Stata to Latex; `\end{verbatim}` stop printing text without Latex typesetting. This may look awkward at the beginnng, but later it will become natural.

```latex
\begin{verbatim}
***/
sysuse auto
summarize mpg price
/***
\end{verbatim}
```

Finally, close your Log File by using the line `log close` at the end of the Do-File. Therefore, when creating the `.tex` file, <u>you must use the same name as the log file</u>. See a short illustration below:

```stata
* Closing the Log File
quietly log close
markdoc MyLog, export(tex) markup(tex) replace
```

If you are using Windows, you can complie the Latex `.pdf` directly from the Do-File (once you have installed the Miktex distribution) by using the `!pdflatex` command and then type the name of the `.tex` file. You can even automatically open the new `.pdf` file by using the command `!explorer` and the name of the file. Se below:

```stata
!pdflatex MyLog.tex
!pdflatex MyLog.tex
!exporer  MyLog.pdf
```

Download the [practice Do-File on Mardoc](https://crenteriam.github.io/files/tutorials/first-practice-markdoc.do).

[Up](#Contents)

[^1]: This is a package that allows you to install packages directly from github. The `github` and (the related) `git` packages are a great improvent for the Stata community. They expand the repositories available for developing and sharing user-written packages. Most importantly, version control platforms, like github, allow the users and developers to access all the versions of a package. In contrast, any update in the `ssc install` repository automatically replaces previous versions (so you can only install the latest version of a package.). See the [github package documentation](https://github.com/haghish/github).
