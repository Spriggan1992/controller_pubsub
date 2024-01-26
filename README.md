
A Flutter package providing a simple implementation of the Publisher-Subscriber pattern for controllers. This package is designed to facilitate communication between controllers.

## Features

- **Controller Listener:** A mixin class that allows classes to listen to controller notifications.

- **Controller Publisher:** A mixin class that provides a mechanism for subscribing to a controller.

- **Controller Watcher:** A singleton class that acts as the central hub for managing controller notifications.

## Getting started

1. Add the dependency to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     controller_pubsub: ^0.0.1

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
/// This is a sample of how to use the [ControllerPublisher] mixin class.
class AuthBloc extends Bloc<AuthEvent, AuthState>
    with ControllerPublisher<AuthBloc> {
  final IAuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthEvent>(
      (event, emit) async {
        await event.map(
          authCheckRequested: (e) async {
            final result = await _authRepository.isSignIn();
            emit(
              result
                  ? const AuthState.authenticated()
                  : const AuthState.initial(),
            );
            if (result) {
              notifySubscribers('Hi there!');  // This will notify all subscribers of this controller.
            }
          },
        );
      },
    );
  }
}

class LogInBloc extends Bloc<LogInEvent, LogInState>
    with ControllerListener<AuthBloc> {

  @override
  void handleNotification([value]) {
    print(value); // This will print 'Hi there!' when the [AuthBloc] notifies this controller.
    super.handleNotification(value);
  }

  @override
  LogInBloc(this._signInRepository) : super(LogInState.initial()) {
    addListener(this); // Don't forget to add the listener to the controller. 
    ....
  }

   @override
  Future<void> close() {
    removeListener(this); // Don't forget to remove the listener from the controller.
    return super.close();
  }
}

```

## Additional information

This package serves as a helper when you need to listen to one BLoC in another BLoC and perform actions when the state changes.
