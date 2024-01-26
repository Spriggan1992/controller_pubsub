import 'package:controller_pubsub/controller_watcher.dart';

/// A mixin that provides a mechanism for subscribing to a controller.
///
/// This mixin is intended to be used with a controller class that extends
mixin ControllerPublisher<T> {
  // Private instance of ControllerWatcher
  final _watcher = ControllerWatcher<T>();

  /// Notifies all the registered listeners of a change to the value.
  ///
  /// This method is a wrapper around [ControllerWatcher.notifyListeners].
  /// [value] is the value to be passed to the listeners.
  void notifySubscribers([dynamic value]) {
    _watcher.notifyListeners(value);
  }
}
