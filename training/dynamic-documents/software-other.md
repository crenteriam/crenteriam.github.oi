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
Software &rarr; <a href="https://crenteriam.github.io/training/stata/stata/">Stata</a> - <a href="https://crenteriam.github.io/training/latex/latex/">Latex</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/software-markdoc/">Markdoc</a> - <a href="https://crenteriam.github.io/training/markdown/markdown/">Markdown</a> - <a href="https://crenteriam.github.io/training/dynamic-documents/software-texteditors/">Text Editors</a>
</p>

### Other Integratin Tools

### Pandoc {#Pandoc}

[Pandoc](https://pandoc.org/index.html) is a tool to produce documents in a variety of formats. Pandoc transforms, for example, a Latex markup language into Markdown. Therefore, by using a single markup language (e.g., `.tex`), you can export to several document (e.g., pdf, docx or html) by using the same source file.

Once installed, you can run pandoc within your Do-File and compile on the fly, among others, `.docx`, `.rtf`, and `.odt` documents (you an open all of them in Microsft Word). The Stata command `!` instructs Stata to interact with the operating system's shell. In other words, you are using Stata as a computer's terminal. By doing so, you can run other softwares within Stata. For example, in the lines below, `!pandoc` is running the software pandoc; then pandoc takes the source `-s` (MyLog.tex) and stores the output `-o` (MyLog.docx).

```stata
!pandoc -s MyLog.tex -o MyLog.docx
!pandoc -s MyLog.tex -o MyLog.rtf
!pandoc -s MyLog.tex -o MyLog.odt
!pandoc -s MyLog.tex -o MyLog.epub
```

### Knitr

### Sweave
