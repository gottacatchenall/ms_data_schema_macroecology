---
bibliography: [references.bib]
---

# Outline

Ecological data as it currently exists is very difficult to access [@Poisot2019EcoDat; @Borregaard2016MorRep; @Gonzalez2015ActSta].
Macroecological data is by definition collected across scales which necessitate collaboration across more individuals than can feasibly coordinate with one-another. Yet, assimilation of ecological data at the planetary scale is necessary both to understand more about ecological processes, but also to the immense challenges posed by understanding and forecasting human influence on biodiversity [@Hampton2013BigDat; @Giron-Nava2017QuaArg].
The solution to this problem is standardization---developing a robust schema such that data collected in a variety of systems can be assimilated and integrated into larger scale analysis of ecological processes. Other scientific disciplines have benefited from open standards for file formats (FITS in astronomy, the neuroscience one, other examples).

The benefits of data standardization:
1) software for data analysis can easily interface with new data, as well as existing databases.

2) reproducability of published results

[@Woolley2020BioMar]


# Data Schema for Macroecology

## Metadata.csv

| OBSERVATION_ID | COORDINATE | SAMPLING EFFORT | DATETIME |
|-|-|-|-|
|-|-|-|-|


## Biotic.csv

| OBSERVATION_ID | TAXONOMIC_ID | OBSERVATION_TYPE | OBSERVATION_VALUE |
|-|-|-|-|
|-|-|-|-|



## Abiotic.csv
- Set of environmental variables. Some are common enough to have predefined
names in the schema (MAT, MAP, Elevation, Humidity, Temperature, blah blah blah)

| OBSERVATION_ID | VARIABLE_NAME | VARIABLE_VALUE | VARIABLE_UNIT |
|-|-|-|-|
|-|-|-|-|


# References
