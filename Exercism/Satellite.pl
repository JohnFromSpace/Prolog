inorder(nil) --> [].
inorder(node(L, N, R)) --> inorder(L), [N], inorder(R). 

preorder(nil) --> [].
preorder(node(L, N, R)) --> [N], preorder(L), preorder(R).

tree_traversals(T, P, I) :- phrase(preorder(T), P), phrase(inorder(T), I).
