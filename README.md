# Align Comments

The goal of this package is to align # comments to the right-most # comment present in a file.

## Installation

You can install the development version from [Github](https://github.com/WilDoane/comment) using devtools:

```r
if (!require(devtools)) install.packages("devtools", dependencies = TRUE)
devtools::install_github("WilDoane/comment")
```

## Purpose

This is a very early stage hack to present heavily commented R scripts in a style where code comments are visually aligned to the character position of the right-most comment # present in the file.

## Use

This package installs an add-in to RStudio. To use it, open an R script in RStudio's source code editor, then select **Align comments** from the Addins menu. 
