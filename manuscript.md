---
bibliography: [references.bib]
---

# Outline

Ecological data as it currently exists is very difficult to access [@Poisot2019EcoDat; @Borregaard2016MorRep; @Gonzalez2015ActSta].
Macroecological data is by definition collected across scales which necessitate collaboration across more individuals than can feasibly coordinate with one-another. Yet, assimilation of ecological data at the planetary scale is necessary both to understand more about ecological processes, but also to the immense challenges posed by understanding and forecasting human influence on biodiversity [@Hampton2013BigDat; @Giron-Nava2017QuaArg].
The solution to this problem is standardization---developing a robust schema such that data collected in a variety of systems can be assimilated and integrated into larger scale analysis of ecological processes. Other scientific disciplines have benefited from open standards for file formats (FITS in astronomy, the neuroscience one, other examples).

The benefits of data standardization:

1. software for data analysis can easily interface with new data, as well as existing databases (less data wrangling)
2. reproducability of published results

[@Woolley2020BioMar]


# Data Schema for Macroecology
## metadata (*.meta)

| STUDY_ID  | OBSERVATION_ID | COORDINATE | SAMPLING EFFORT | DATETIME |
|-|-|-|-|-|
|-|-|-|-|-|
|-|-|-|-|-|



## occupancy/abundance data (*.occ)

| OBSERVATION_ID | TAXONOMIC_ID | OBSERVATION_TYPE | OBSERVATION_VALUE |
|-|-|-|-|
|-|-|-|-|
|-|-|-|-|-|

## trait data (*.trait)

| OBSERVATION_ID | TAXONOMIC_ID | TRAIT_TYPE | TRAIT_VALUE |
|-|-|-|-|
|-|-|-|-|
|-|-|-|-|-|


## abiotic environment data (*.env)
- Set of environmental variables. Some are common enough to have predefined
names in the schema (MAT, MAP, Elevation, etc.), but there may need to be room for studies to also name define system-specific env variables?

| OBSERVATION_ID | VARIABLE_NAME | VARIABLE_VALUE | VARIABLE_UNIT |
|-|-|-|-|-|
|-|-|-|-|-|
|-|-|-|-|-|

## interaction data (*.int)

| OBSERVATION_ID | TAXONOMIC_ID1 | TAXONOMIC_ID2 | INTERACTION_TYPE | INTERACTION_VALUE |
|-|-|-|-|-|
|-|-|-|-|-|
|-|-|-|-|-|

## meta-metadata? (*.stdy)

| STUDY_ID  | DATA_TYPE | DATA_URL | CONTACT_PERSON |
|-|-|-|-|-|
|-|-|-|-|-|
|-|-|-|-|-|



# References
