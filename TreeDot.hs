{-
Simple data types and functions to visualize trees.

Author: Pieter Staal
-}

module TreeDot (RoseTree(RoseNode), exportTree) where

type Label = String
type ID = String

data RoseTree = RoseNode String [RoseTree]
    deriving (Show, Eq)

data DotTree = DotNode ID Label [DotTree]
    deriving (Show, Eq)

    
testtree = RoseNode "0" [RoseNode "11" [RoseNode "21" [RoseNode "31" [],RoseNode "32" []],RoseNode "22" []],RoseNode "12" [RoseNode "23" [],RoseNode "24" [RoseNode "33" [],RoseNode "34" []]]]

largetree = RoseNode "large" [testtree, testtree, testtree]
hugetree = RoseNode "huge" [largetree, testtree, largetree]

pp :: RoseTree -> DotTree
pp rosetree = pp' "" 1 rosetree


pp' :: String -> Int -> RoseTree -> DotTree
pp' id idx (RoseNode label subtrees) = DotNode id' label subtrees'
    where
        id' = (id ++ show idx)
        subtrees' = map (\(t, i) -> pp' id' i t) (zip subtrees [1..])

exportTree :: RoseTree -> IO ()
exportTree tree = writeFile "out.dot" (makeDot $ pp tree)

makeDot :: DotTree -> String
makeDot tree = prelude ++ tree2dot tree ++ end
    where
        prelude = "graph{\n    node [shape=\"none\"];\n"
        end = "}"

tree2dot :: DotTree -> String
tree2dot (DotNode id label []) = labelStat id label
tree2dot (DotNode id label subtrees) = labelStat id label ++ concat connectStats ++ nextlevel
    where
        nextlevel = concat $ map tree2dot subtrees
        
        connectStats = map (connectStat id) subtrees


-- strings are not escaped, so students putting in strings with quotation marks may give 
-- incorrect dot files.
connectStat :: ID -> DotTree -> String
connectStat id (DotNode cid _ _) = "    " ++ id ++ "--" ++ cid ++ "\n"

labelStat :: ID -> Label -> String
labelStat id lbl = "    " ++ id ++ " [label=\"" ++ lbl ++ "\"];\n"