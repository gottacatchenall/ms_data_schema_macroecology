---
bibliography: [references.bib]
---

# Introduction

Ecological data as it exists is very difficult to access and reuse
[@Poisot2019EcoDat; @Borregaard2016MorRep; @Gonzalez2015ActSta]. Many databases
of ecological and environmental data exist, but synthesizing this data into a
single product suitable for analysis often remains tedious, as data are not in
formats that can be easily interfaced. Yet, assimilation of data at increasing
spatial and temporal scales is necessary to answer both pure and applied
questions about biodiversity and to quantify human influence on the biosphere
[@Hampton2013BigDat; @Giron-Nava2017QuaArg]. Next-generation biodiversity
monitoring will necessitate the collection and processing of increasing amounts
of data from a variety of sources, requiring increasing flexibility and
automation for computationally intensive tasks. Macroecological data is, by
definition, collected across scales which necessitate collaboration across more
individuals than can feasibly coordinate with one-another. The solution to this
problem is standardization---developing a robust schema such that ecological
data collected in a variety of contexts can be assimilated and integrated into
larger scale analysis of ecological processes.

How does standardization solve this problem? Adopting a standard representation
of ecological data will have three primary benefits: 1) it will enable new forms
of analysis by making combining data from different sources easier, 2) enable
continuous integration of new data for next-generation biodiversity monitoring,
3) aid in reproduceability for published results. In order to illustrate this,
we provide case studies of other disciplines that have seen these benefits and
greatly reduced the overhead of data assimilation across large spatial and
temporal scales. We the conclude by show how `EcoJulia`, a set of libraries,
tools, and database interfaces written in the `Julia` programming language
[@cite], enables simpler synthesis of macroecological data than existing tools,
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

How does Julia solve this problem?

- type system enables abstract representation of different data types
- creating an api for a data base is as simple as implementing the interface to the abstract data type
- idiomatic, high performance, parallelizable.
- built in tools for testing
- built in tools for parallelization
- built in package manage
- shorter, more readable, more reusable code than certain competing languages

![the caption](./figures/concept.png)



#### notes


> Machine learning methods have proven unreasonably effective for large scale data,
and so we should strive to put as many of them together.
We don't need to use the raw data  
in these methods, we most likely should be using engineered features,  
and writing feature extraction code is orders of magnitudes easier when  
the data are standardized.
The issue of data gaps is also becoming less and less important (what Invenia is doing with their Impute project is amazing, for example), so we really should be merging everything we can. This is the strong argument for a minimum core of interoperable data.


# References
