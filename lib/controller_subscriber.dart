import 'package:controller_pubsub/controller_watcher.dart';

/// A mixin class that can be used to listen to controller notifications.
///
/// This mixin class is used by the [ControllerWatcher] class to notify
/// listeners when a controller is added or removed.
///
/// See also:
///
///  * [ControllerWatcher]
///  * [ControllerSubscriber]
mixin class ControllerSubscriber<T> {
  /// Handles notifications received by the subscriber.
  ///
  /// This method is invoked when the subscribed controller notifies about a
  /// change, passing an optional [value]. Implement this method to define
  /// custom handling of notifications in your subscriber class.
  void handleNotification([dynamic value]) {}

  /// Adds a listener to the list of listeners.
  ///
  /// This method is a wrapper around [ControllerWatcher.addListener].
  /// [listener] is the listener to be added.
  void addListener(ControllerSubscriber<T> listener) {
    ControllerWatcher<T>().addListener(listener);
  }

  /// Removes a listener from the list of listeners.
  ///
  /// This method is a wrapper around [ControllerWatcher.removeListener].
  /// [listener] is the listener to be removed.
  void removeListener(ControllerSubscriber<T> listener) {
    ControllerWatcher<T>().removeListener(listener);
  }
}
