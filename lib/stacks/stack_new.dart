import 'dart:collection';

/// Classical Stack implementations it has features
// Hello
class Stack<T> {
  final _linkedList = LinkedList<StackItem<T>>();

  /// add [item] to the stack
  void push(T item) {
    _linkedList.add(StackItem<T>(item));
  }

  /// remove last items from stack
  T? pop() {
    if (_linkedList.isNotEmpty) {
      var stackItem = _linkedList.last;
      _linkedList.last.unlink();
      return stackItem.item;
    }
    return null;
  }

  /// [peek] last items from stack
  T? get peek => _linkedList.isNotEmpty ? _linkedList.last.item : null;

  /// [isEmpty] is empty
  bool get isEmpty => _linkedList.isEmpty;

  @override
  String toString() => _linkedList.toString();
}

final class StackItem<E> extends LinkedListEntry<StackItem<E>> {
  final E item;
  StackItem(this.item);

  @override
  String toString() => item.toString();
}
