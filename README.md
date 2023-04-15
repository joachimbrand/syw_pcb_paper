# Using Julia

Fork this repo to easily use Julia in showyourwork. The following modifications were made to the default template:

1. Defined `src/scripts/paths.jl`, replacing `src/scripts/paths.py` (just a convenience file which defines paths when you `include()` it).
2. Added `julia=1.8.5` to the conda `environment.yml`.
3. Created a `Project.toml` to define Julia dependencies.
4. Created two example scripts in `src/scripts/`:
  - `data.jl`, to create a dataset and save it to `mydata.csv`, and
  - `plot.jl`, to plot the dataset and save it to `myplot.png`.
5. Created three Snakemake rules:
  - `julia_manifest` creates `Manifest.toml` from the `Project.toml`.
  - `data` calls `data.jl`, and depends on `Manifest.toml`.
  - `plot` calls `plot.jl`, and depends on `mydata.csv` and `Manifest.toml`.
  
These three Julia jobs are dependencies of the final rule, which compiles the LaTeX document using `tectonic`.
The generated PDF and arXiv tarball will contain `myplot.png`.

---

<p align="center">
<a href="https://github.com/showyourwork/showyourwork">
<img width = "450" src="https://raw.githubusercontent.com/showyourwork/.github/main/images/showyourwork.png" alt="showyourwork"/>
</a>
<br>
<br>
<a href="https://github.com/MilesCranmer/showyourwork_julia_example/actions/workflows/build.yml">
<img src="https://github.com/MilesCranmer/showyourwork_julia_example/actions/workflows/build.yml/badge.svg?branch=main" alt="Article status"/>
</a>
<a href="https://github.com/MilesCranmer/showyourwork_julia_example/raw/main-pdf/arxiv.tar.gz">
<img src="https://img.shields.io/badge/article-tarball-blue.svg?style=flat" alt="Article tarball"/>
</a>
<a href="https://github.com/MilesCranmer/showyourwork_julia_example/raw/main-pdf/ms.pdf">
<img src="https://img.shields.io/badge/article-pdf-blue.svg?style=flat" alt="Read the article"/>
</a>
</p>

An open source scientific article created using the [showyourwork](https://github.com/showyourwork/showyourwork) workflow.
