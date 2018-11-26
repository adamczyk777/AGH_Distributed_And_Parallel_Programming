-module(bst).
-compile(export_all).
-record(node, {value = nil, left = nil, right = nil}).

insert(nil, Value) ->
    #node{value=Value, left=nil, right=nil};
insert(#node{value=Value, left=Left, right=Right}, NewValue) when NewValue < Value ->
    #node{value=Value, left=insert(Left, NewValue), right=Right};
insert(#node{value=Value, left=Left, right=Right}, NewValue) when NewValue >= Value ->
    #node{value=Value, left=Left, right=insert(Right, NewValue)}.

randomBst(0) -> nil;
randomBst(Length) ->
    insert(randomBst(Length - 1), rand:uniform(20)).

bstFromList([]) -> nil;
bstFromList([H|L]) -> 
    bstFromList(L, insert(nil, H)).
bstFromList([], Tree) ->
    Tree;
bstFromList([H|L], Tree) ->
    insert(bstFromList(L, Tree), H).

inorder(Tree) when Tree#node.value == nil -> [];
inorder(nil) -> [];
inorder(Tree) ->
    inorder(Tree#node.left) ++ [Tree#node.value] ++ inorder(Tree#node.right).
