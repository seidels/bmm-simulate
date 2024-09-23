# A boundary mutation model simulator

This repository is a fork of the original [bmm-simulate](https://github.com/pomo-dev/bmm-simulate) package developed by Dominik Schrempf. The Docker setup was added to simplify installation and usage but all credit for the code goes to the original authors.


For a given species tree (topology and branch lengths; Newick format), simulate
evolutionary sequences under the boundary mutation model which is used by
polymorphism-aware phylogenetic models (PoMo). The output is a [counts
file](http://www.iqtree.org/doc/Polymorphism-Aware-Models#counts-files).

The [PoMo reference
implementation](http://www.iqtree.org/doc/Polymorphism-Aware-Models) is part of
the [IQ-TREE software package](http://www.iqtree.org/).

For a detailed description of this software, please refer to

- Schrempf, D., Minh, B. Q., von Haeseler, A., & Kosiol, C., Polymorphism-aware
  species trees with advanced mutation models, bootstrap and rate heterogeneity,
  bioRxiv, (2019). http://dx.doi.org/10.1101/483479

For a description of the boundary mutation model and PoMo, please refer to the
following papers in reverse chronological order.

- Schrempf, D., & Hobolth, A., An alternative derivation of the stationary
  distribution of the multivariate neutral wright–fisher model for low mutation
  rates with a view to mutation rate estimation from site frequency data,
  Theoretical Population Biology, 114(), 88–94 (2017).
  http://dx.doi.org/10.1016/j.tpb.2016.12.001

- Schrempf, D., Minh, B. Q., De Maio, Nicola, von Haeseler, A., & Kosiol, C.,
  Reversible polymorphism-aware phylogenetic models and their application to
  tree inference, Journal of Theoretical Biology, 407(), 362–370 (2016).
  http://dx.doi.org/10.1016/j.jtbi.2016.07.042

- De Maio, N., Schrempf, D., & Kosiol, C., Pomo: an allele frequency-based
  approach for species tree estimation, Systematic Biology, 64(6), 1018–1031
  (2015). http://dx.doi.org/10.1093/sysbio/syv048

# Installation
This repository provides a Docker-based installation for the bmm-simulate package to simplify the installation process, especially for users who may encounter outdated dependencies.

1. Clone the repository:
```bash
git clone https://github.com/seidels/bmm-simulate.git
cd bmm-simulate
```

2. Build the Docker image:
```bash
docker build --platform linux/amd64 -t bmm-simulator .
```

3. Run the container
```bash
docker run --platform linux/amd64 -t bmm-simulator bmm-simulate -h
```
