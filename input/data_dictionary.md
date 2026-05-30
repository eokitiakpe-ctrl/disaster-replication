# Data Dictionary

## Source
Cavallo, E., Galiani, S., Noy, I., and Pantano, J. (2013). Catastrophic Natural Disasters and Economic Growth. Review of Economics and Statistics, 95(5): 1549-1561.

Replication data available at: https://doi.org/10.7910/DVN/26717

## Files

### disaster_macro.dta
Main disaster dataset from EM-DAT database.

| Variable | Description | Units | Source |
|----------|-------------|-------|--------|
| wbcode | World Bank country code | string | World Bank |
| year | Year of observation | year | EM-DAT |
| country | Country name | string | EM-DAT |
| LargeDisaster | Binary indicator for large disaster event | 0/1 | EM-DAT |
| tot | Total number of disaster events in country-year | count | EM-DAT |
| gdppccteus | Real GDP per capita in constant US dollars | USD | WDI |

### data_GDP_regressionsV2.dta
GDP and macroeconomic covariates for synthetic control analysis.

| Variable | Description | Units | Source |
|----------|-------------|-------|--------|
| wbcode | World Bank country code | string | World Bank |
| year | Year of observation | year | - |
| gdppccteus | Real GDP per capita in constant US dollars | USD | WDI |
| topen | Trade openness (exports + imports / GDP) | ratio | WDI |
| landarea | Land area | km2 | WDI |
| pop | Population | persons | WDI |
| infcpia | Inflation (CPI) | percent | WDI |
| POL2 | Polity 2 democracy index | -10 to 10 | Polity IV |
| lat | Latitude | degrees | - |

### gdp_ppp_PWT.dta
Real GDP per capita from Penn World Tables used in synthetic control.

| Variable | Description | Units | Source |
|----------|-------------|-------|--------|
| wbcode | World Bank country code | string | World Bank |
| year | Year of observation | year | - |
| rgdpl | Real GDP per capita (Laspeyres) | PPP USD | Penn World Tables |
| rgdpch | Real GDP per capita (chain-weighted) | PPP USD | Penn World Tables |
