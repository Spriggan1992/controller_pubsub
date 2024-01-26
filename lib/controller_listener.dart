import 'package:controller_pubsub/controller_watcher.dart';

/// A mixin class that can be used to listen to controller notifications.
///
/// This mixin class is used by the [ControllerWatcher] class to notify
/// listeners when a controller is added or removed.
///
/// See also:
///
///  * [ControllerWatcher]
///  * [ControllerListener]
mixin class ControllerListener<T> {
  void handleNotification([dynamic value]) {}

  /// Adds a listener to the list of listeners.
  ///
  /// This method is a wrapper around [ControllerWatcher.addListener].
  /// [listener] is the listener to be added.
  void addListener(ControllerListener<T> listener) {
    ControllerWatcher<T>().addListener(listener);
  }

  /// Removes a listener from the list of listeners.
  ///
  /// This method is a wrapper around [ControllerWatcher.removeListener].
  /// [listener] is the listener to be removed.
  void removeListener(ControllerListener<T> listener) {
    ControllerWatcher<T>().removeListener(listener);
  }
}
