inorder(nil) --> [].
inorder(node(L, N, R)) --> inorder(L), [N], inorder(R). 
