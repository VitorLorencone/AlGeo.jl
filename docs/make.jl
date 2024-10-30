using Documenter
include("../src/AlGeo.jl")
using .AlGeo

makedocs(
    sitename = "AlGeo",
    format = Documenter.HTML(),
    modules = [AlGeo],
    repo = Documenter.Remotes.GitHub("VitorLorencone", "AlGeo.jl"),
    pages = [
        "index.md" => [
            "teste/mod1.md"
        ]
    ]
)