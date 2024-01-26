import 'package:controller_pubsub/controller_listener.dart';
import 'package:controller_pubsub/controller_publisher.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:controller_pubsub/controller_watcher.dart';

void main() {
  group('ControllerListener', () {
    test('addListener and removeListener', () {
      // Arrange
      final controllerListener = MyControllerListener();

      // Act
      controllerListener.addListener(controllerListener);
      controllerListener
          .handleNotification(); // Notify should not throw an error
      controllerListener.removeListener(controllerListener);
      controllerListener
          .handleNotification(); // Notify should not throw an error
    });
  });

  group('ControllerWatcher', () {
    test('addListener and removeListener', () {
      // Arrange
      final controllerWatcher = ControllerWatcher<TestType>();
      final controllerListener = MyControllerListener();

      // Act
      controllerWatcher.addListener(controllerListener);
      controllerWatcher.notifyListeners(); // Notify should not throw an error
      controllerWatcher.removeListener(controllerListener);
      controllerWatcher.notifyListeners(); // Notify should not throw an error
    });
  });
}

class TestType {}

class MyControllerListener with ControllerListener<TestType> {}

class MyControllerPublisher with ControllerPublisher<TestType> {}
