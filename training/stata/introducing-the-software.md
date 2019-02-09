---
title: Stata - Introducing the Software
layout: contents
tags: stata, introduction
---

[Teaching](../../../teaching) &rarr; [Introduction to Stata](stata.md) &rarr; Introducing the Software

<a name="SectionMenu"></a>

| Block         | Title  |
|:-------------:|--------------|
| **1**         | [Introduction](#Introduction)   |
| **2**         | [Getting Help in Stata](#HelpStata)  |
| **3**         | [Stata Syntax](#StataSyntax)  |
| **4**         | [Load, Import, and Save](#Load)  |
| **5**         | [Data Editor, Variables Manager and Variable Types](#DataEditor)  |
<!-- NAVIGATION TOOLS
<a href="/teaching">Teaching Menu</a>
<a onclick="window.history.back()">Back</a>
[Home2]({{ site.url }}/)
<a href='{{site.url}}/'>Home3</a>
<a name="Introduction"></a-->

### Introduction
The goal of this module is to give you a first introduction to the software. After this module you must be familiar with Stata's environment and having programmed basic commands. In this module, you will learn: 1) Stata's software environment, 2) getting help in Stata, 3) programming syntax, and 4) manage files (load, import, and save).
Introduction to the Environment. Watch the mini-lecture Getting Started with Stata. Then, watch Stephen Weinberg’s video Introduction to Stata to see some examples and extended lecture about Stata’s environment.

<u>Practice I</u>

Using the *Command Window*, use the command `display` to perform the following operations:

-	Calculate 4 plus 4
-	Calculate 8 times 24
-	Take the log of 2 –also use the command log()
-	Calculate the square of 6
-	Calculate the root square of 24 –also use the command sqrt()
-	Display your full name in the Results Window

<u>Practice II</u>

For Practice II, you must first load a dataset into Stata. We will load a built-in dataset `auto.dta` (further explanations on data management are in next section). So, type `sysuse auto` in the *Command Window*. The name of the dataset is "1978 Automobile Data," as shown in the *Results Window*. Now, explore the information about this dataset by looking at the *Variables Window* and *Properties Windows*. Then, answer the following questions:

-	How many variables does the dataset have?
-	Are all these variables labeled?
-	How many observations do the dataset contains?
-	Select the variable price in the *Variables Window*, and then look at the variable properties in the *Properties Window*. What type of variable is this?
-	Use the commands `summarize` and describe for your first explorations of the dataset.

<u>Practice III<u/>

This is an introduction to basic data reporting commands. The commands `browse` and `edit` will pop up the *Data Editor*; `edit` allows you to edit the values in the dataset, whereas `browse` doesn’t (never edit your original dataset, always use `browse`). Now, explore the dataset typing each of the following lines:

```Stata
describe
describe price make
codebook
codebook foreign
list
list make
list make in 1/5
browse
edit
table foreign
summarize
summarize price
summarize weight-foreign
```
[Go Up](#SectionMenu)

<a name="HelpStata"></a>
### Getting Help in Stata

Watch the mini-lecture Getting Help in Stata. Now, go through the examples and explanations provided by Dr. Weinberg in his video Help Files and Documentation. Help files are not so intuitive to read. It may take you a little bit to get used to them. Weinberg's video will provide you a good starting point on that. There are two types of help documentation. The first is the one that shows up immediately after you type help in the Command Window, whereas the second is a PDF document. PDF Documentations contain more extended remarks than Stata's quick help interphase. In many cases, the PDF help documentation is very useful as statistical studying materials. It provides explanations of the statistical method, examples, suggested readings, and technical notes (which explain how the command is performing the statistical calculation). These materials could be helpful for you in the case you are struggling with some concepts reviewed in class, since they provide explanations followed by simple examples.

Other great sources for help are the Stata’s documentation. One of the best references for this course is Stata User’s Guide. Stata's documentation is not the only source of help (and, for data management troubleshooting it may not be very useful). Look for help in Statalist (the official Stata's listserv). Statalist is a very active forum where people post questions, and experts help providing great advice. Experts tend also to respond on substantive statistical questions in advanced topics in statistics. In Statalist, there is sort of an etiquette that you must consider if you want to have a helpful feedback (or feedback at all). So, if you are looking for help in Statalist, check out the recommendations here and here. Previous students have successfully used Statalist to get advice during the replication assignments or other statistical projects.
Keep that in mind, but for the purposes of this course, most of the problems you might encounter were surely asked already. Thus, your major task (most likely) must be to hone your search skills and get to the right answered posts in Statalist. Finally, do not underestimate YouTube videos or blogs. There is a lot of materials in these platforms produced by institutions (i.e. Stata Corporation), or other professors. You might find (believe it or not) posts or YouTube videos for very specific steps or commands. Stata's community is vibrant.

<u>Practice I</u>

1.	Use the command `help` in the *Command Window* to review the Documentation of the commands: `summarize`, `regress`, and `generate`.

<a name="StataSyntax"></a>
### Stata Syntax

Watch the mini-lectures Introduction to Stata - Syntax and then Command Line Syntax. Some parts repeat; nevertheless, if you are not familiar with Stata’s syntax, repetition is good. For further review and examples, check Stata User’s Guide 11 Language Syntax and sections 13.1 to 13.3 (pp.s 1-7) in 13 Functions and expressions.

<u>Practice I<u/>

1.	Summarize the variable Mileage if the cars are domestic using the option detail.

2.	After reading the documentation for the command `generate`, do the following: generate a numeric variable named "HighPerformance" if the mileage per hour of the car is above.

3.	Generate a numeric variable named "NewPrice" where the new variable "Expensive" is equal to the values of the variable price times three.

4.	By reading the documentation for the command `regress`, do the following: `regress` the variable `price` on the variable `mileage` if the car is domestic AND if the weight is above 3015.

<a name="Load"></a>
### Load, Import, and Save

Stata’s native file extension is `.dta`. These are the files you are referring to, when telling to Stata to open or save a dataset. If you want to load a dataset that is originally not in a .dta extension (for example, `.xlsx`, `.csv`, `.sav`), the you tell Stata to import the dataset. If you want to save a running dataset into a file extension different than `.dta`, then you must tell stata to export it. Watch the mini-lecture Opening a Dataset for opening `.dta` and importing `.xls` and `.csv` files. To save Stata files, watch the mini-lecture Saving Data in Stata. Here is an example of using these commands. Note that there is another file extension related to Stata (the file `.do`). This is not a dataset, it is a programming file that is commonly known as **Do-File**. We will review this in [Module 2]().

Make sure you know how to save datasets in Stata version 13. Based on our previous experiences, we will have a variety of versions running among student’s computers. `.dta` files saved in Stata 14 or 15 won’t open in Stata 13 or less. To make sure we won’t have this problem, all files must be saved as Stata 13 version (teach yourself how to do it by typing help saveold in the *Command Window*). Also notice the replace option when saving files. If the file name already exists, Stata will send you an error message; to avoid this, use the option replace when saving.

To pull data from a website just replace the computer file path for a website URL. For example, to open a .dta file type:
use `http://www.qogdata.pol.gu.se/data/qog_std_cs_jan18.dta`

To import another file extension, for instance .csv, type:
Import delimited `http://www.qogdata.pol.gu.se/data/qog_std_cs_jan18.csv`
Finally, in many occasions, we will use some built-in datasets. This is handy because we can all access the same dataset from any computer, and because most of Stata Help examples are based on these datasets. The most common is the dataset `auto.dta`, “1978 Automobile Data.” To load built in data type sysuse and then the name of the dataset. For example, sysuse auto. To check out the complete list of datasets type sysuse dir or help dta_examples.

<u>Practice I</u>

1.	Load the built-in dataset `auto`,

2.	Load the built-in dataset `census`, save it in your computer as a `.dta` file Version 13. Name it `census_statav13.dta` and close Stata. Then, go to the file `census_statav13` that you have created and open it.

3.	Go to the Quality of Government Standard Data website, download the Stata file for the The QoG Cross-Section Data, and open it. Export it in your computer as a `.csv` file with the name `qog_2018.csv` Then, load the file from Excel.

4.	Import this `.csv` file: `http://www.qogdata.pol.gu.se/data/qog_std_cs_jan18.csv`. Take a brief look on it (use commands describe, browse, etc.). And then close Stata without saving the dataset.

5.	Open Stata again and import your `.csv` file `qog_2018.csv` You can use the drop-down menu if you want. Remember to use the first row for variable names.

<a name="DataEditor"></a>
### Data Editor, Variables Manager and Variable Types

The Data Editor is the window that will display the dataset. The most common way to access it is to type browse in the *Command Window*. Watch the mini-lecture Using *Data Editor* to see how to access it. Review the example Stata Data Sets, and make sure you know what colors displayed in the cells mean in the Data Editor. Then, review 12.1 Data and datasets and 12.2 Numbers.

Another window is the *Variables Manager*, which allow you to edit label over variables and values. Watch the mini-lecture How to label variables. Review the examples in 12.6 Dataset, variable and value labels. Then, review 12.9 Data Editor and Variables Manager.

**41 Commands everybody should know.** Read 41 Commands Everybody Should Know. This is a list of commands you should be familiar with for the first part of the class.
