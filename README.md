# Simple Plots for Scientific Reporting

This package offers simple, minimalist plot functions while also providing an interface to standardize plot settings, so all group members can simply import them and not worry about maintaing the same style throught their report.
The focus of this package is not on flexibility, but rather to provide semi-standardized plotting tools. Regardless, workhorse functions are also available for detailed costumization.

Small tweaks to graphical parameters are provided, including an option to reset them (`reset.par()`) and several presets for consistent image sizes and proportions.
The package also includes tools for color picking, alongside colordblind-friendy preset palettes.

**Note that the following lists are not fully implemented**


## Types of plots supported
This package intends to provide plot functions for the most common plot types:
- line and scatter plots
- equation plots
- box plots
- histograms
- bar plots
- ternary diagrams
- scalograms


## Graphical Parameter Tweaks
Functions added include:
- `reset.par()` to set `par` to its default values
- `set.stdpar()` to set the current `par` as a preset
- `save.par()` to store the current `par`
- `read.par()` to load a stored `par`
- `std.par()` to use presets


## Color Management Tools
These tools include:
- `view.palette()` to view available palettes
- `load.palette()` to use a preset palette
- `save.palette()` to save a vector of HEX as a preset
- `mod.palette()` to modify a preset 

Color picking tools are also available:
- `blind.palette()` to modify a palette to be more colorblind friendy
- `bnw.palette()` to turn a palette black and white

**WARNING: user save presets are currently not preserved through package updates. To be fixed soon.**
