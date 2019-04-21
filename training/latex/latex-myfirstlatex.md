


```latex
\documentclass{article}
\begin{document}
This text will be printed in the body of the document.
\end{document}
```

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

Watch the video [Starting a Report and Title Page](https://www.youtube.com/watch?v=7HC9xEZsqdM) to see how to help yourself making your first report (one that includes title, author, and sections).

Alexander Baran-Harper have put on YouTube a nice, short and complete series of videos of [Latex Report Writing Tutorials](https://www.youtube.com/watch?v=FXujG7c9p8g&list=PLNnwglGGYoTtW7o4PHFOSWGevcdFa3v3D). These videos go over all you need to know about Latex for this book.

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
