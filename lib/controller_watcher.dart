import 'package:flutter/foundation.dart';

import 'controller_listener.dart';

/// A class that can be extended to provide a mechanism for notifying listeners of changes to a value.
///
/// This class is a singleton, so it can be used to notify listeners of changes to a value from anywhere in the app.
base class ControllerWatcher<T> {
  // Private constructor to prevent instantiation from outside
  ControllerWatcher._();

  /// Static instance variable to have single instance of [ControllerWatcher]
  static final Map<Type, dynamic> _instances = {};

  /// Factory constructor to lazily initialize the instance of [ControllerWatcher]
  factory ControllerWatcher() {
    // Initialize the instance if it is nul otherwise return the already initialized instance
    if (_instances[T] == null) {
      _instances[T] = ControllerWatcher<T>._();
    }

    return _instances[T]!;
  }

  final ObserverList<ControllerListener<T>> _listeners =
      ObserverList<ControllerListener<T>>();

  /// Returns a copy of the list of registered listeners.
  ///
  /// The list returned by this method is a copy of the internal list of listeners and is safe to iterate over.
  List<ControllerListener<T>> get listeners {
    final localListeners = List<ControllerListener<T>>.from(_listeners);

    return localListeners;
  }

  /// Notifies all the registered listeners of a change to the value.
  void notifyListeners([dynamic value]) {
    for (final listener in listeners) {
      if (!_listeners.contains(listener)) {
        return;
      }

      listener.handleNotification(value);
    }
  }

  /// Adds a listener to the list of listeners.
  ///
  /// If the listener is already registered, this method has no effect.
  void addListener(ControllerListener<T> listener) {
    _listeners.add(listener);
  }

  /// Removes a listener from the list of listeners.
  ///
  /// If the listener is not registered, this method has no effect.
  void removeListener(ControllerListener<T> listener) {
    _listeners.remove(listener);
  }
}
