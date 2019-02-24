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


[markdoc documentation](https://github.com/haghish/markdoc)

### Why is it important?


### How does it work?


### Installing Markdoc

To install markdoc first, you need to install the package `github`.[^1] Then, from the newly installed `github` package, use the command `github install` to install the `markdoc`, but make sure to install the version "3.8.0". Newer versions will automatically write some latex code for you, but will restrict your options on managing Latex.

- describe statax, weaver, synlight.

```stata
net install github, from("https://haghish.github.io/github/") replace
github install haghish/markdoc, version("3.8.0") replace
markdocpandoc // installs pandoc
ssc install statax
ssc install weaver
ssc install synlight
```

You may encounter an error that says [ado file already exists]. Yoy will need to manually delete that file. to do so, you need to find the folder where stata installs all user-written in ado/plus
- whats ado
- difference between base and plus

If you dont find the folder, you can type sysdir in the console and look for the path at the righ ot plus
[print screen below]

![print screen of sysdir]()

Download the practice Do-File [First Mardoc Practice](first-practice-markdoc.do)



[^1]: This is a package that allows you to install packages directly from github. The `github` and (the related) `git` packages are a great improvent for the Stata community. They expand the repositories available for developing and sharing user-written packages. Most importantly, version control platforms, like github, allow the users and developers to access all the versions of a package. In contrast, any update in the `ssc install` repository automatically replaces previous versions (so you can only install the latest version of a package.). See the [github package documentation](https://github.com/haghish/github).
