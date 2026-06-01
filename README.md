# Replication of Figure 1: Increasing Prevalence of Natural Disasters

This repository replicates Figure 1 from Cavallo, Galiani, Noy, and Pantano (2013), "Catastrophic Natural Disasters and Economic Growth." The figure shows the annual number of recorded natural disaster events and large disaster events from 1970 to 2007.

## Citation

Cavallo, E., Galiani, S., Noy, I., and Pantano, J. (2013). Catastrophic natural disasters and economic growth. Review of Economics and Statistics, 95(5), 1549-1561.

## Data

The replication uses the authors' publicly available replication data from Harvard Dataverse. The relevant input file is:

input/disaster_macro_V2_by_event.dta

## Requirements

This project uses R 4.3.2 and the following R packages:

- haven
- dplyr
- readr
- ggplot2

## Reproducing the results

From the repository root, run:

make

Or use the convenience wrapper:

bash run_all.sh

The scripts produce:

- output/figures/main_figure.png
- output/tables/main_result.tex

## Results

The original paper reports 342 total disaster events and 9 large events in 2007. This replication obtains the same values: 342 total events and 9 large events in 2007.
