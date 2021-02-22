---
bibliography: [references.bib]
---

# Abstract
Macroecological data is, by definition, collected across scales which necessitate collaboration across more individuals than can feasibly coordinate with one-another. Yet assimilation of data at large spatial and temporal scales is necessary to answer both pure and applied questions about biodiversity and to quantify human influence on the biosphere [@Hampton2013BigDat; @Giron-Nava2017QuaArg]. The solution to this problem is standardization---developing a robust schema such that data collected in a variety of systems can be assimilated and integrated into larger scale analysis of ecological processes. Other scientific disciplines have benefited from open standards for file formats (FITS in astronomy, the neuroscience one, other examples). [@Woolley2020BioMar]


# Outline

**1. Introduction**

_Paragraph One (250 words)_: What are the current problems with the availability of ecological data?
   - Ecological data as it currently exists is very difficult to access and reuse  [@Poisot2019EcoDat; @Borregaard2016MorRep; @Gonzalez2015ActSta].
   - Combining ecological data from many sources remains difficult yet necessary.
   - Many databases of ecological and environmental data exist, yet synthesizing this data into a single product suitable for analysis often remains tedious.
   - Next-generation biodiversity monitoring will necessitate the collection and processing of increasing amounts of data from a variety of sources, requiring increasing flexibility and automation for computationally intensive tasks.
   > Yup. Also important to point out that we don't need to use the raw data  
   in these methods, we most likely should be using engineered features,  
   and writing feature extraction code is orders of magnitudes easier when  
   the data are standardized.
   - Machine learning methods have potential for large scale data
   > ML tools have proven that data are unreasonably  effective, and so we should strive to put as many of them together. The issue of data gaps is also becoming less and less important (what Invenia is doing with their Impute project is amazing, for example), so we really should be merging everything we can. This is the strong argument for a minimum core of interoperable data.


_Paragraph Two (250 words):_ Why is an open standard for data representation a solution?
- Open standards for the representation of ecological data have three primary benefits
- 1) enable new forms of analysis by making combining data from different sources easier
- 2) enable continuous integration of new data for next-generation biodiversity monitoring
- 3) aid in reproduce-ability for published results.
> Let's lead with this. This is the core argument, where we solve three  
isseus at once: we come unstuck from quantitative tools from two  
generations ago, we get closer to real-time surveillance, and we  
prevent further issues in reproducibility.
> All of this is to say, we should maybe call them "data representation"  
or "interoperable data structures", rather than data formats



_Paragraph Three (250 words):_ How will they do this? We display case studies where standardization of data has enabled other fields
- We show how EcoJulia enables standardization of data and provides a foundation for open standards

_Paragraph Four (250 words):_ What is the rest of this paper?
- Case studies of data standardization that has enabled coordination at the scale required for global ecology

2. _**BOX: case studies:** (300 words)_
- .fasta (100 words)
   > I think it's important to drive this point home using bioinformatics as  
   an example: their research costs a lot more, and yet they are sharing  
   data in a way that is simple. We are developing a joint pipeline  
   consuming all of genbank nucleotide and all of the sequence read  
   archive, and it's feasible because we know what to expect. As of 2021,  
   no one is able to aggregate all of biodiversity knowledge.
- GeoTIFF (100 words)
- FITS (100 words)
   - any time a telescope is turned on, its data is made available publicly in a standardized formal
   - crucially, whether the person collecting data from a telescope at a given time.
   - "The subject who is supposed to recycle presupposes and subject who isn't"---just as declaring the subject who is supposed to share data presupposes a subject who isn't,

3. **An open standard for macroecological data: EcoJulia** (_500 words_)
- idiomatic, high performance, parallelizable.
- combining data from different sources is as simple as writing an interface between types  



![the caption](./figures/concept.png)


# References
