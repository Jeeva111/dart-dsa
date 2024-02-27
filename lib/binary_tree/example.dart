import 'binary_tree.dart';

void main() {
  var tree = BinaryTree();
  tree.insert(11);
  tree.insert(8);
  tree.insert(18);
  tree.insert(15);
  tree.insert(10);
  tree.insert(16);
  tree.breadthFirstSearch();
}
