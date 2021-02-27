---
bibliography: [references.bib]
---

# Introduction

Ecological data as it exists is very difficult to access and reuse
[@Poisot2019EcoDat; @Gonzalez2015ActSta]. Many databases of ecological and
environmental data exist, but synthesizing this data into a single product
suitable for analysis often remains tedious as data are not in formats that can
be easily interfaced. Despite this, the assimilation of data at increasing spatial and
temporal scales is necessary, both to answer pure and applied questions about
biodiversity and to quantify human influence on the biosphere
[@Giron-Nava2017QuaArg]. Next-generation biodiversity monitoring will
necessitate the collection and processing of increasing amounts of data from a
variety of sources, requiring increasing flexibility and automation for
computationally intensive tasks [@Hampton2013BigDat]. Macroecological data is,
by definition, collected across scales which necessitate collaboration across
more individuals than can feasibly coordinate with one-another. The solution to
this problem is standardization [@Zimmerman2008NewKno]---developing a robust
schema such that ecological data collected in a variety of contexts can be
assimilated and integrated into larger scale analysis of ecological processes.

How does standardization solve this problem? Adopting a standard representation
of ecological data will have three primary benefits: **1**) it will enable new
forms of analysis by making it easier to combine data from different sources
[@Heberling2021DatInt], **2)** enable continuous integration of new data for
next-generation biodiversity monitoring [@Kuhl2020EffBio], and **3)** aid in
reproduceability and integration of published results [@Borregaard2016MorRep;
@Zimmerman2008NewKno]. In order to illustrate this, we provide case studies of
other disciplines that have seen these benefits and greatly reduced the overhead
of data assimilation across large spatial and temporal scales. We the conclude
by show how `EcoJulia`, a set of libraries, tools, and database interfaces
written in the `Julia` programming language [@Bezanson2015JulFre], enables
simpler synthesis of macroecological data than existing tools, and is primed to
become a vitally needed open-standard for ecological data.

# Lessons from Bioinformatics

Other scientific disciplines have benefited from open standards for data
representation [@Woolley2020BioMar].

Bioinformatics faced similar challenges in standardizing data.

Sequence data collected from different machines, with different methodologies to be synthesized


The `.FASTA` format for representing genomic sequences, a standard maintained by
NCBI, enables integration with NCBI's standardized taxonomy identifiers further
enables `FASTA` files to reference metadata about each sequence.


The message here is automation (in-situ sensors routinely uploading data to
servers, servers continuously pulling satellite data), and subsequent
dimensionality reduction and composition of different remotely collected data.


# Toward an open standard for ecological data: _EcoJulia_

`EcoJulia` is a set of analysis packages and database interfaces for ecological
data written in the `Julia` programming language [@Bezanson2015JulFre]. EcoJulia
embodies an open standard for how ecological data is represented by using
`Julia`'s type system to create a set interoperable data structures.
The key is `EcoBase`, a package in EcoJulia which enables common representation
of data from different sources that represent that same type of information.
This creates a living standard for ecological data embodied in
the code defining data types.


Type hierarchies and multiple dispatch.
Each data point is  as a subtype of the abstract type
`AbstractThing`, which defines the fields for a given data type.
(e.g. objects of type `AbstractLocationData` can be either `AbstractPointData`
 or `AbstractLatticeData`). Dispatch can be done to diffe


Using common type representation as a bridge between data and analysis enables
straightforward integration of new data sources as we do not have to change any
of the analysis code to run it on data from a new source (see @fig:concept).
Creating an API to integrate a new database is as simple as implementing the
interface from the data source to the `EcoBase` data types.

![the caption](./figures/concept.png){#fig:concept}


If data aggregation and assembly is the only necessary step in incorporating new
data into analysis, and you ensure the data/interface pair is publicly
available, this data can then easily be incorporated into new analysis because
the interface to change the column names/format of the original data already
exist. The combined data/interface package gives you everything you need to have
data in the proper structures, which can be combined with data from anywhere
else.

Why else is `julia` good?

- idiomatic, high performance, parallelizable.
- built in tools for testing
- built in tools for parallelization
- built in package manage
- shorter, more readable, more reusable code than certain competing languages


## Example with SimpleSDMLayers.jl

It would be cool if this worked, but it doesn't

```

using SimpleSDMLayers
using GBIF
using Plots

occurrence = occurrences(taxon("Picea pungens"))    
boundingBox = bounds(occurrence)
environment = worldclim(collect(1:19); boundingBox...)

sdm = RandomForest(environment, occurrence, boundingBox)
plot(sdm)

```


# References
