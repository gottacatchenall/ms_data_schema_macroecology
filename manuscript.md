---
bibliography: [references.bib]
---


# Introduction

Ecological data is often difficult to access and reuse [@Poisot2019EcoDat;
@Gonzalez2015ActSta]. Macroecological data is, by definition, collected across
scales which necessitate collaboration across more individuals than can feasibly
coordinate with one-another. In practice, ecological data is collected for a
purpose at a a given spatial/temporal/organizational scale. Combining this data
would be good. We want to use this data to test hypotheses on many spatial and
temporal scales. Assimilation of data at increasing spatial and temporal scales
is necessary, both to better understand macroecology and biogeography, but also
to quantify human influence on the biosphere and as a product of this
quantification to mitigate its negative effects [@Giron-Nava2017QuaArg]. Many
databases of ecological and environmental data exist, but synthesizing this data
into a single product suitable for analysis often remains tedious as data are
not in formats that can be easily interfaced.


The solution to this problem is standardization [@Zimmerman2008NewKno]---developing
a robust schema such that ecological data collected in a variety of contexts can
be assimilated and integrated into larger scale analysis of ecological
processes. How does standardization solve this problem? Adopting a standard
representation of ecological data will have three primary benefits: **1**) it
will enable new forms of analysis by making it easier to combine data from
different sources [@Heberling2021DatInt], **2)** enable continuous integration
of new data for next-generation biodiversity monitoring [@Kuhl2020EffBio], and
**3)** aid in open sharing and reproduceability of published results
[@Borregaard2016MorRep; @Zimmerman2008NewKno].

Here we briefly review the approaches to data standardization have been developed in other fields of study that have faced similar challenges. We then propose building
a living standard for ecological data in the `Julia` programming language, and argue
the case for why a living standard for ecological data is required to obtain
the benefits or standardization mentioned above.



# A brief history of data standards

Standardization of data in the sciences has long been done by defining a common
file format.



The `.FASTA` format for representing genomic sequences, a standard maintained by
NCBI, enables integration with NCBI's standardized taxonomy identifiers further
enables `FASTA` files to reference metadata about each sequence. Macroecological
tools would be wise to use preexisting taxonomical standards as species
identifiers.



The `FITS` format in astronomy.

Computer networking and `HTTP`, `IP`, etc.
Enables automation because there is no ambiguity in what is being sent and
received between clients.

### Open and accessible

Publication necessitates making data available in a public repository that is
in the standardized format (`.FASTA`)

### Automated integration

Another message here is automation (in-situ sensors routinely uploading data to
servers, servers continuously pulling satellite data), and subsequent
dimensionality reduction and composition of different remotely collected data.


## Why has this proven difficult in ecology?

Why? Macroecological data is variable. The are no fixed set of variables
used in ecological studies, and using different forms to represent the same
data can be benefitial depending on context.


We propose defining the standard within a programming language (Julia).
There is no one correct way to represent data,
the best format for data representation is context-dependent. Leveraging Julia's
type system.

As an example, consider the increasingly ubiquitous case of attempting to associate
climate data (derived from WorldClim, CHLSEA, or similar) with species occurrence
data.



In the modern era, nearly all scientists rely on scientific software for some
aspect of their work, including but not limited to:
data processing, statistical analyses, and simulation.
Next-generation biodiversity monitoring will
necessitate the collection and processing of increasing amounts of data from a
variety of sources, requiring the software used to handle this data
is flexible and enables for computationally intensive tasks [@Hampton2013BigDat].



# Using `Julia` to define living data standards

`Julia` is a programming language designed for modern scientific computing.  

In practice, `Julia` is written much like the dynamically-typed, interpreted
languages currently popular (R, Python).

However, unlike these languages, Julia is designed from the beginning to promote
design patterns from object-oriented languages.  

Need an explanation of OOP paradigms, etc here.  

Object-oriented design patterns
  1. overloading of functions, dispatch
  2. types and type hierarchies

By making type a huge part of the language you can get the speed benefits of
static typed languages.

![todo](./figures/concept.png){#fig:concept}


Why else is julia good?
    idiomatic
    high performance
    built in tools for testing
    built in tools for parallelization
    built in package manager
    shorter, more readable, more reusable code than certain competing languages

Last paragraph about the potential workings of EcoJulia.
EcoBase is a package in EcoJulia which enables common representation of ecological data that represents the same type of information. This creates a living standard for ecological data embodied in the code defining data types. Using standardized types as a bridge between data and analysis is how we create an open standard for ecological data. This splits the processes of data aggregation and data analysis into discrete parts.
Integrating either data from a particular study, or a new database, is as simple as implementing the interface from the data source to the EcoBase data types. This will make combining data from multiple sources easier, and yield benefits for the development and implementation of novel methods, as the analysis code becomes separate from the data source (see fig. 1). In turn, this will enable specialization in development of analysis tools that can be scaled to meet the needs of next-generation biodiversity monitoring. Published data can be incorporated into public repositories containing both the origin data and the interface to transform it into EcoJulia data structures, and this combined data/interface package is all that is needed to either reproduce the results or incorporate that data into a larger data assemblage.

trophic levels of dependencies for ecojulia


# References
