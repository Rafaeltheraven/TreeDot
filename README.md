# TreeDot

Exports the `RoseTree` datatype and a function `exportTree` which generates a dot-file corresponding to that tree. The dot file can then be easily visualized in several ways.

## Exporting a tree

Use the `exportTree` function to export a tree to a dot file:

```exportTree myRoseTree "graph.dot"```

## Using graphviz

With the graphviz software installed the following command converts the dot file to an image:

```dot -Tpng graph.dot > out.png```

Or view the file with `xdot`:

```xdot graph.dot```

If `xdot` is installed, this command can also be called from GHCI using the `xdot` function:

```xdot myRoseTree```

## Online tools

This online tools exists to view dot files:

https://dreampuf.github.io/GraphvizOnline/: Make sure you set the engine to 'dot' and the format to 'svg' (these should be the defaults).