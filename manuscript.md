---
bibliography: [references.bib]
---

# Introduction

Ecological data as it exists is very difficult to access and reuse
[@Poisot2019EcoDat; @Gonzalez2015ActSta]. Many databases
of ecological and environmental data exist, but synthesizing this data into a
single product suitable for analysis often remains tedious, as data are not in
formats that can be easily interfaced. Yet, assimilation of data at increasing
spatial and temporal scales is necessary to answer both pure and applied
questions about biodiversity and to quantify human influence on the biosphere
[@Giron-Nava2017QuaArg]. Next-generation biodiversity
monitoring will necessitate the collection and processing of increasing amounts
of data from a variety of sources, requiring increasing flexibility and
automation for computationally intensive tasks [@Hampton2013BigDat]. Macroecological data is, by
definition, collected across scales which necessitate collaboration across more
individuals than can feasibly coordinate with one-another. The solution to this
problem is standardization [@Zimmerman2008NewKno]---developing a robust schema such that ecological
data collected in a variety of contexts can be assimilated and integrated into
larger scale analysis of ecological processes.

How does standardization solve this problem? Adopting a standard representation
of ecological data will have three primary benefits: **1**) it will enable new forms
of analysis by making it easier to combine data from different sources [@Heberling2021DatInt], **2)** enable
continuous integration of new data for next-generation biodiversity monitoring [@Kuhl2020EffBio], and
**3)** aid in reproduceability for published results [@Borregaard2016MorRep] and enable integration of old data into current studies [@Zimmerman2008NewKno]. In order to illustrate this,
we provide case studies of other disciplines that have seen these benefits and
greatly reduced the overhead of data assimilation across large spatial and
temporal scales. We the conclude by show how `EcoJulia`, a set of libraries,
tools, and database interfaces written in the `Julia` programming language
[@Bezanson2015JulFre], enables simpler synthesis of macroecological data than existing tools,
and is primed to become a vitally needed open-standard in ecology.


# Box: Case Studies of Open Standards

Other scientific disciplines have benefited from open standards for data
representation [@Woolley2020BioMar].

## Case Study One: Bioinformatics

Start with the most familiar example to ecologists. Bioinformatics faces similar
challenges in standardizing data. `.fasta` format for representing genomic
sequences. The FASTA format, a standard maintained by NCBI, enables sequence
data collected by different people, from different machines, with different
methodology to be combined. The integration with NCBI's standardized taxonomy
identifiers further enables `FASTA` files to reference metadata about each
sequence.

## Case Study Two: Computer Networking

The development of hypertext transfer protocol (HTTP) provided a standard that
enabled different computer users, using different internet browsers and hardware
from different companies, to all parse and send content over the same internet.

## Case Study Three: Astronomy

Flexible Image Transport Systems (`.FITS`) is a data standard in astronomy that
has proven successful in developing a culture of open data. Every time the
instrument is turned on, it can report data to a public repository in the
specified format, detaching the collection and analysis of data done by an
individual from the process of making that information publicly available.


# Toward an open standard for ecological data: _EcoJulia_

`EcoJulia` is a set of analysis packages and database interfaces for ecological
data written in the `Julia` programming language [@Bezanson2015JulFre]. How does
EcoJulia enable data standardization? The key is `Julia`'s type system, which
enables abstract representation of data from different sources that represent
that same type of information. Each data point is represented as a type
`AbstractThing`. The set of analysis tools in `EcoJulia` each run on collection
of `AbstractThings` (called an `AbstractAssemblage`). Using the abstract type as
a bridge between the data and the analysis enables standardization of data
representation, which is embodied as a living standard in the code defining
abstract types (see @fig:concept). This means that we do not have to change any
of the analysis code to run it on data from a new source, and creating an API to
integrate a database is as simple as implementing the interface from the data
source to the abstract data type.

![the caption](./figures/concept.png){#fig:concept}


Why else is `julia` good?

- idiomatic, high performance, parallelizable.
- built in tools for testing
- built in tools for parallelization
- built in package manage
- shorter, more readable, more reusable code than certain competing languages



# References
