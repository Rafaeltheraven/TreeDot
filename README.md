# TreeDot

Exports the `RoseTree` datatype and a function `exportTree` which generates a dot-file corresponding to that tree. The dot file can then be easily visualized in several ways:

## Using graphviz

With the graphviz software installed the following command converts the dot file to an image:

```dot -Tpng out.dot > out.png```

## Online tools

This online tools exists to view dot files:

https://dreampuf.github.io/GraphvizOnline/: Make sure you set the engine to 'dot' and the format to 'svg' (these should be the defaults).