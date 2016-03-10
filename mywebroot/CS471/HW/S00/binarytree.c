#include <stdio.h>
/* 3/2/00 */

typedef struct tnode *TreePtr;  /* k&r p146 */

typedef struct tnode { /* the tree node; */
  int value;
  TreePtr left;
  TreePtr right;
  int max;
  int min;
} Treenode;

TreePtr newItem (int value) {
  TreePtr newitem;   
  newitem = (TreePtr) malloc( sizeof( Treenode));
  if (newitem == NULL) {
    printf("insert: Out of memory\n");
    exit(1);
  }
  newitem->value = value;
  /* printf("%d\n",newitem->value); */
  newitem->left = NULL;
  newitem->right = NULL;
  return newitem;  
}


TreePtr insert(TreePtr tree, TreePtr newleaf) {
  if (tree == NULL) { /* new tree... */
    return newleaf;
  }
  if  (tree->value == newleaf->value) {
    printf("insert: duplicate entry %d ignored", newleaf->value);
  } else if (tree->value > (newleaf->value)) {
    tree->left = insert(tree->left, newleaf);
  } else {
    tree->right = insert(tree->right, newleaf);
  }
  return tree;
}

void prettyprint(TreePtr tree, int ind){
  
  if (tree == NULL){
    return;
  }

  prettyprint(tree->right, ind+4);
  printf("%-*s%d\n", ind," ", tree->value);
  prettyprint(tree->left, ind+4);
}

TreePtr mktest(){
  TreePtr tree = NULL;
  TreePtr newitem;
  printf("Binary Search Tree\n");

  newitem = newItem(20);
  tree = insert(tree,newitem);
    
  newitem = newItem(30);
  tree = insert(tree,newitem);
  

  newitem = newItem(3);
  tree = insert(tree,newitem);
  

  newitem = newItem(99);
  tree = insert(tree,newitem);
  

  newitem = newItem(25);
  tree = insert(tree,newitem);
  

  newitem = newItem(3);
  tree = insert(tree,newitem);
  
  prettyprint(tree,0);
  
  return tree;
}

  
main (){
  TreePtr tree;
  tree = mktest();
}




