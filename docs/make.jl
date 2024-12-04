using Documenter
include("../src/Mingal.jl")
using .Mingal

makedocs(
    sitename = "Mingal",
    format = Documenter.HTML(),
    doctest = true,
    modules = [Mingal],
    repo = Documenter.Remotes.GitHub("VitorLorencone", "Mingal.jl"),
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

deploydocs(
    repo = "github.com/VitorLorencone/Mingal.jl.git",
    devbranch = "main"
)