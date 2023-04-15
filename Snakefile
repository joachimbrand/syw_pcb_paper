import platform

if platform.system() == "Darwin" and platform.processor().startswith("arm"):
    import os
    os.environ["CONDA_SUBDIR"] = "osx-64"
    # Needed until https://github.com/conda-forge/julia-feedstock/pull/224 merges.

rule julia_manifest:
    input: "Project.toml"
    output: "Manifest.toml"
    shell: "julia --project=. -e 'using Pkg; Pkg.instantiate(); Pkg.precompile()'"

rule data:
    input:
        "src/scripts/data.jl",
        "Manifest.toml"
    output: "src/data/mydata.csv"
    shell: "julia --project=. {input[0]} {output}"

rule plot:
    input:
        "src/scripts/plot.jl",
        "src/data/mydata.csv",
        "Manifest.toml"
    output: "src/tex/figures/myplot.png"
    shell: "julia --project=. {input[0]} {input[1]} {output}"
