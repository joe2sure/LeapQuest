import 'dart:collection';

class ObjectPool<T> {
  final Queue<T> _pool = Queue<T>();
  final T Function() _createObject;
  final void Function(T)? _resetObject;

  ObjectPool(this._createObject, {void Function(T)? resetObject})
      : _resetObject = resetObject;

  T get() {
    if (_pool.isEmpty) {
      return _createObject();
    }
    return _pool.removeFirst();
  }

  void release(T object) {
    if (_resetObject != null) {
      _resetObject(object);
    }
    _pool.addLast(object);
  }

  void clear() {
    _pool.clear();
  }

  int get size => _pool.length;
}