---
bibliography: [references.bib]
---
Macroecological data is by definition collected across scales which necessitate collaboration across more individuals than can feasibly coordinate with one-another. Yet, assimilation of ecological data at the planetary scale is necessary both to understand more about ecological processes, but also to the immense challenges posed by understanding and forecasting human influence on biodiversity [@Hampton2013BigDat; @Giron-Nava2017QuaArg]. The solution to this problem is standardization---developing a robust schema such that data collected in a variety of systems can be assimilated and integrated into larger scale analysis of ecological processes. Other scientific disciplines have benefited from open standards for file formats (FITS in astronomy, the neuroscience one, other examples). [@Woolley2020BioMar]


# Outline

**1. Introduction**

_Paragraph One (250 words)_: What are the current problems with the availability of ecological data?
   - Ecological data as it currently exists is very difficult to access and reuse  [@Poisot2019EcoDat; @Borregaard2016MorRep; @Gonzalez2015ActSta].
   - Combining ecological data from many sources remains difficult yet necessary.
   - Many databases of ecological and environmental data exist, yet synthesizing this data into a single product suitable for analysis often remains tedious.
   - Next-generation biodiversity monitoring will necessitate the collection and processing of increasing amounts of data from a variety of sources, requiring increasing flexibility and automation for computationally intensive tasks.
   - Machine learning methods have strong potential for large scale data


_Paragraph Two (250 words):_ Why are open standards a solution?
- Open standards for the representation of ecological data will 1) enable new forms of analysis by making combining data from different sources easier, 2) enable continuous integration of new data for next-generation biodiversity monitoring, and 3) aid in reproduce-ability for published results.

_Paragraph Three (250 words):_ How will they do this? We display case studies where standardization of data has enabled other fields
- We show how EcoJulia enables standardization of data and provides a foundation for open standards

_Paragraph Four (250 words):_ What is the rest of this paper?
- Case studies of data standardization that has enabled coordination
at the scale required for global ecology
- f

2. _**BOX: case studies:** (300 words)_
- .fasta (100 words)
   - Open standard (.fasta)
- GeoTIFF (100 words)
- FITS (100 words)

3. **EcoJulia** (_500 words_)
-




> All of this is to say, we should maybe call them "data representation"  
or "interoperable data structures", rather than data formats
> Let's lead with this. This is the core argument, where we solve three  
isseus at once: we come unstuck from quantitative tools from two  
generations ago, we get closer to real-time surveillance, and we  
prevent further issues in reproducibility.



2.
> Tim:
> ML tools have proven that data are unreasonably  effective, and so we should strive to put as many of them together. The issue of data gaps is also becoming less and less important (what Invenia is doing with their Impute project is amazing, for example), so we really should be merging everything we can. This is the strong argument for a minimum core of interoperable data.

3.

4. Next-generation biodiversity monitoring will necessitate the collection and processing of increasing amounts of data from a variety of sources, requiring increasing flexibility and automation for computationally intensive tasks.

> Yup. Also important to point out that we don't need to use the raw data  
in these methods, we most likely should be using engineered features,  
and writing feature extraction code is orders of magnitudes easier when  
the data are standardized.


5. Standardized forms of data representation have proved fruitful in  
   enabling data sharing and reproducible results across the sciences.

> I think it's important to drive this point home using bioinformatics as  
an example: their research costs a lot more, and yet they are sharing  
data in a way that is simple. We are developing a joint pipeline  
consuming all of genbank nucleotide and all of the sequence read  
archive, and it's feasible because we know what to expect. As of 2021,  
no one is able to aggregate all of biodiversity knowledge.

![the caption](./figures/concept.png)


# References
