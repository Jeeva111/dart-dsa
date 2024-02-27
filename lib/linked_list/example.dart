import 'package:algorithm/algorithm.dart';

void main(List<String> args) {
  LinkedList<int> ll = LinkedList();
  ll.add(1);
  ll.add(2);
  ll.add(3);
  ll.add(4);
  ll.add(5);
  ll.add(6);
  print(ll);
  ll.reverse();
  print(ll);
}

class Node {
  final int data;
  Node? node;
  Node(this.data, [this.node]);
}
