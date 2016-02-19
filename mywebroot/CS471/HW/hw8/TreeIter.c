#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

/* ---------------------------------------------------------------------------- 
 * Node 
 * ---------------------------------------------------------------------------- */
typedef struct _Node {
  int val;
  struct _Node *left;
  struct _Node *right;
  struct _Node *parent;
} Node;

Node* NodeCreate(int val) {
  Node *node = malloc(sizeof(Node));
  node->val = val;
  node->left = NULL;
  node->right = NULL;
  node->parent = NULL;
  return node;
} 

void NodeDelete(Node *node) {
  free(node);
}

/* ---------------------------------------------------------------------------- 
 * Tree
 * ---------------------------------------------------------------------------- */
typedef struct _Tree {
  Node *root;
} Tree;

void TreeInsert(Tree*, int);

Tree* TreeCreate(int *vals, int size) {
  Tree* tree = malloc(sizeof(Tree));
  tree->root = NULL;
  for (int i = 0; i < size; ++i) {
    TreeInsert(tree, vals[i]);
  }
  return tree;
}

void TreeDeleteNode(Node *node) {
  if (node->left != NULL) {
    TreeDeleteNode(node->left);
  }
  if (node->right != NULL) {
    TreeDeleteNode(node->right);
  }
  NodeDelete(node);
}

void TreeDelete(Tree *tree) {
  if (tree->root != NULL) {
    TreeDeleteNode(tree->root);
  }
  free(tree);
}

void TreeInsert(Tree *tree, int val) {
  if (tree->root == NULL) {
    tree->root = NodeCreate(val);
    return;
  }

  Node *prev = NULL;
  Node *iter = tree->root;
  while(iter != NULL) {
    prev = iter;
    if (val == iter->val) {
      return;
    }
    iter = (val < iter->val) ? iter->left : iter->right;
  }

  if (val < prev->val) {
    prev->left = NodeCreate(val);
    prev->left->parent = prev;
  } else {
    prev->right = NodeCreate(val);
    prev->right->parent = prev;
  }
}

/* ---------------------------------------------------------------------------- 
 * TreeIter
 * ---------------------------------------------------------------------------- */
typedef struct _TreeIter {
  Node *next; 
} TreeIter;

TreeIter* TreeIterCreate(Tree *tree) {
  // Code
}

void TreeIterDelete(TreeIter *iter) {
  // Code
}

int TreeIterDone(TreeIter *iter) {
  // Code
}

void TreeIterNext(TreeIter *iter) {
  // Code
}

int TreeIterVal(TreeIter *iter) {
  // Code
}

/* ---------------------------------------------------------------------------- 
 * Sample Driver 
 * ---------------------------------------------------------------------------- */
#define SIZE(X) (sizeof(X)/sizeof(X[0]))

int main() {
  int arr[] = {7, 5, 9, 3, 4, 6, 8};
  Tree *t = TreeCreate(arr, SIZE(arr));

  TreeIter *iter = TreeIterCreate(t);
  while(!TreeIterDone(iter)) {
    fprintf(stdout, "%d ", TreeIterVal(iter));
    TreeIterNext(iter);
  }
  fprintf(stdout, "\n");
  TreeIterDelete(iter);

  TreeDelete(t);
  return 0;
}

