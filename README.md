# Install
Add to your `pubspec.yaml` dependencies following line
```
  estado: ^0.0.9
```

## A framework agnostic state management library based on MVVM
Estado is a framework agnostic state management library based on MVVM. It's an alternative approach to BloC or Provider
that allows you to build your UI without any framework specific code, your build method will be pure Flutter code again and 
not bloated with 3rd party code.

You don't have to learn any magic, state management is completely in your hands again and
your build Method won't need any Providers or anything else. 


## Features

Just Framework agnostic State Management that won't touch your UI code.

## Getting started

Think about how your UI should behave, what states do you need?
Create a ViewModel for your Stateful Widget and call your data or domain layer from there.
And then you emit a new State and your UI will handle that state. Your `build()` of your Flutter
Widget is 100% free from any library regarding State management, as it should be. You can focus
fully on writing your UI using the Flutter SDK or other UI libs.

## Usage

Here's a simple code snippet how to use this library to separate the state from your UI
```dart
// The ViewModel manipulates the state of your UI, it calls your underlying layer, which could be a Repository or a Service / UseCase (in case you use clean architecture)
// possibly orchestrates / aggregates data, and then emits a new event to the UI which causes a state change.
class LoginViewModel extends EventViewModel {
  
  void logIn(String email, String password) {
    // LoadingState could be a State defined in a common package or so
    notify(LoadingEvent(isLoading: true));
    
    authRepository.login(email, password);
    
    // let's assume login was successful
    notify(LoadingEvent(isLoading: false));
    notify(OnLoginSuccessfulEvent());
  }
}

// A simple LoginSuccessfulEvent that indicates the UI that the login was successful
class LoginSuccessfulEvent extends ViewEvent{
  LoginSuccessfulState() : super();
}

// A simple wrapper around the State object, which hold now a ViewModel and takes care of the lifecycle handling
// and gives you a callback when your ViewModel is ready to use and when it emits a new event.
class LoginUiState extends ViewState<LoginViewModel, LoginWidget> {
  bool _loginSuccessful = false;
  bool _isLoading = false;
  
  
  @override
  Widget build(BuildContext context) {
    // build your pure Flutter UI here, no Providers or anything else needed.
    return Container(
      child: _isLoading ? CircularProgressIndicator() : 
      Column(children:[]),
    );
  }
  
  @override
  void notify(ViewModelEvent event) {
    setState(() {
      switch(event.runtimeType) {
          case LoginSuccessfulEvent:
            // do something with the event, maybe navigate to another screen
            break;
        case LoadingEvent:
            _isLoading = (event as LoadingEvent).isLoading;
            break;
      }
    });
  }
  
  @override
  LoginViewModel buildViewModel() {
    // do your ViewModel initialization and dependency injection here
    return LoginViewModel();
  }
  
  @override
  
}
```

## Additional information

If you wish to contribute feel free to create a PR at the github repo. For bugs or feature requests
you can create an Issue.

