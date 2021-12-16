import 'dart:async';

abstract class BaseState<T> {

  late T state;

  BaseState({required this.state});

  final _streamController = StreamController<T>.broadcast();

  void update(T data) {
    state = data;
    _streamController.add(state);
  }

  Stream<T> get stream => _streamController.stream;
}