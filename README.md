---
title: Best Practices. For Science.
author: J. Alexander Branham
---

This repository contains materials presented at a Grad Student Organization led "Best Practices and Workflow Workshop." 

The presentation I gave is a latex document in the presentation folder. The awesome-paper.Rnw file is a file that can be used to learn about all the tools I mention in the presentation. 

# Install

You'll need to install the tools I talked about in the presentation:

* latex (to make a pdf file)
* pandoc (to make a docx file)
* R (for the analysis)
* make (if you want to use the makefile to easily output to pdf or docx)
* git (to keep track of changes you make)

Finally, if you want to compile the presentation, you'll need  and the Adobe Source Code Pro fonts installed and in a place that xelatex can find them. 

# Usage

You can use git to download this project to your device. Open a terminal (or a git GUI if you prefer) and run:

    git clone https://github.com/jabranham/best-practices-workflow.git
    
This will download the whole project --- history included --- to a folder on your computer. If you want to control exactly where the folder goes, just open up a terminal with that folder set as the working directory. 

If you don't want to mess with git, you can simply download the whole project as a zip file from its github page.

Our awesome-paper is supposed to be reminiscent of a typical quantitative paper. The steps to recreate the paper go like so:

1. Download the data, clean it up a bit, and save the cleaned data (if you were doing a real project you'd also want to save the original data). We do this by running the code/beer-data.R file.
2. Write up our analysis in a Rnw file where we can mix latex with R code. We then run this through `knitr` to actually run the R code to produce the figures, tables, etc. `knitr` works its magic and outputs a `tex` file
3. Run the `tex` file through latex to get a pdf. 
4. (optionally) get a file that Word can open by running the `tex` file through `pandoc`

Luckily, if we use `make`, we don't actually need to remember any of that. Instead, we can simply drop into a terminal and run `make pdf`, which will do the steps necessary to get a pdf and output it to the `output/` folder (which will be created if it doesn't exist). I also chose some options in the makefile so that all the latex files that get produced also get placed in the `output/` folder. 

If you then decide that you want a document that can be opened in Word, you can do `make odt` instead. `odt` is a file extension similar to `docx` but `pandoc` has an easier time dealing with. `odt` files will open fine in Word, where you can then save to `docx` if necessary. You can also open the Makefile and change all instances of `odt` to `docx` and `pandoc` will produce a `docx` file directly, but I've had less success with this (tables seem to get messed up).
