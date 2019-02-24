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



### Pandoc

Markup format

[Pandoc](https://pandoc.org/index.html) is a tool to produce documents in a variety of formats. Pandoc transforms, for example, a Latex markup language into Markdown. Therefore you can produce different document (e.g., pdf, docx or html) by using the same source file.

`markdocpandoc` is an userwritten command within the `markdoc` package that installs some pandoc features. This will help you export your dynamic document into several formats.

You can run pandoc directly from Stata by using the commands below
- formats, docx, rft, odt can be open in Word.

```stata
!pandoc -s XXX.tex -o XXX.docx
!pandoc -s XXX.tex -o XXX.rtf
!pandoc -s XXX.tex -o XXX.odt
!pandoc -s XXX.tex -o XXX.epub
```




### Knitr

### Sweave
