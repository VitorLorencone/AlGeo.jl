using Documenter
include("../src/AlGeo.jl")
using .AlGeo

makedocs(
    sitename = "AlGeo",
    format = Documenter.HTML(),
    doctest = true,
    modules = [AlGeo],
    repo = Documenter.Remotes.GitHub("VitorLorencone", "AlGeo.jl"),
    pages = [
        "Home" => "index.md",
        "Manual" => [
            "Installation" => "install.md",
            "Functions" => "functions.md",
            "Examples" => "examples.md"
        ],
        "References" => "references.md"
    ]
)