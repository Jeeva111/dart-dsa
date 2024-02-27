/// Custom linked list implementation
class LinkedList<T> {
  _Node<T>? _first;
  _Node<T>? _last;
  int count = 0;

  /// [addFirst] used to add first element to the 📃
  void addFirst(T item) {
    _Node<T> node = _Node(data: item);
    node.next = _first;
    _first = node;
    updateCounter();
  }

  /// [add] used to add element to 🔚 of list
  void add(T item) {
    _Node<T> node = _Node(data: item);
    if (isEmpty) {
      _initialize(node);
    } else {
      _last?.next = node;
      _last = node;
    }
    updateCounter();
  }

  /// [indexOf] return a index of node if not exists returns -1
  int indexOf(T item) {
    int index = -1;
    if (_first != null) {
      return _traverse(item: item).index;
    }
    return index;
  }

  /// [contains] method returns if element is exists
  /// ```dart
  /// boolean ```
  bool contains(T item) => indexOf(item) != -1;

  void remove(T item) {
    var curr = _first;
    var prev = _first;
    if (curr != null && curr.data == item) {
      _first = curr.next;
      return;
    }
    while (curr != null) {
      if (curr.data == item) {
        prev!.next =
            curr.next; // Update the 'next' pointer of the previous node
        curr.next = null; // Disconnect the removed node from the list
        break;
      }
      prev = curr;
      curr = curr.next;
    }
  }

  void reverse() {
    var prev = _first;
    var curr = _first?.next;
    while (curr != null) {
      var next = curr.next;
      curr.next = prev;
      prev = curr;
      curr = next;
    }
    _last = _first;
    _last?.next = null;
    _first = prev;
  }

  T? findK(int k) {
    var p1 = _first;
    var p2 = _first;
    for (var i = 0; i < k - 1; i++) {
      p2 = p2!.next;
    }
    while (p2!.next != null) {
      p1 = p1!.next;
      p2 = p2.next;
    }
    return p1?.data;
  }

  bool get isEmpty => _first == null;

  ({int index, _Node<T>? node}) _traverse({int? index, T? item}) {
    if (_first case (_Node<T> head) when index != null || item != null) {
      if ((item == head.data) || (index != null && index == 0)) {
        return (index: 0, node: head);
      }
      int resultIndex = 0;
      while (head.next != null) {
        resultIndex++;
        if ((item != null && head.next!.data == item) ||
            (index != null && index == resultIndex)) {
          return (index: resultIndex, node: head);
        }
        head = head.next!;
      }
    }
    return (index: -1, node: null);
  }

  void _initialize(_Node<T> node) {
    _first = _last = node;
  }

  void updateCounter() {
    count++;
  }

  @override
  String toString() => _first == null ? "List is empty 📦" : _first.toString();
}

/// Implementation of Node
final class _Node<T> {
  final T data;
  _Node<T>? next;
  _Node({required this.data, this.next});

  @override
  String toString() =>
      next == null ? "[$data]" : "[$data] => ${next.toString()}";
}
