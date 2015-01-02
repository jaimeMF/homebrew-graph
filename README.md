# brew-graph

`brew-graph` is an external command for Homebrew that generates a Graphviz dot file from the dependecy graph.

## Installation

Run

```shell
brew install graphviz
brew tap jaimeMF/graph
```

## Usage

```shell
brew graph | dot -Tsvg -ohomebrew.html
open homebrew.html
```

## License

The command [was originally in the Homebrew repository](https://github.com/homebrew/homebrew/blob/c0b99c031fec0a2096b85a458d7b42e3627560d8/Library/Contributions/cmd/brew-graph), it has the [same license as Homebrew](https://github.com/Homebrew/homebrew/blob/master/README.md#license).
