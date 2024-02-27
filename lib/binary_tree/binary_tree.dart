class BinaryTree {
  Tree? node;

  void insert(int value) {
    if (node == null) {
      node = Tree(value);
      return;
    }
    var curr = node;
    while (true) {
      if (curr!.value > value) {
        if (curr.lc == null) {
          curr.lc = Tree(value);
          break;
        }
        curr = curr.lc;
      }
      if (curr!.value < value) {
        if (curr.rc == null) {
          curr.rc = Tree(value);
          break;
        }
        curr = curr.rc;
      }
    }
  }

  void traverse(Tree? root) {
    if (root == null) {
      return;
    }
    traverse(root.lc);
    traverse(root.rc);
    print(root.value);
  }

  @override
  String toString() {
    traverse(node);
    return "";
  }

  void breadthFirstSearch() {
    int h = height(node);
    for (int i = 0; i < h; i++) {
      processCurrentLevel(node, i, i);
    }
  }

  void processCurrentLevel(Tree? root, int lev, int level, [int side = 0]) {
    if (root == null) return;
    if (lev == 0) {
      print("(${root.value}) $level, $side");
    } else if (lev > 0) {
      processCurrentLevel(root.lc, lev - 1, level, 0);
      processCurrentLevel(root.rc, lev - 1, level, 1);
    }
  }

  int height(Tree? root) {
    if (root == null) {
      return 0;
    } else {
      int leftHeight = height(root.lc);
      int rightHeight = height(root.rc);
      if (leftHeight > rightHeight) {
        return (leftHeight + 1);
      } else {
        return (rightHeight + 1);
      }
    }
  }
}

class Tree {
  final int value;
  Tree? lc;
  Tree? rc;
  Tree(this.value, [this.lc, this.rc]);

  @override
  String toString() => "($value)";
}
