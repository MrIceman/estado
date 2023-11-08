# Install
Add to your `pubspec.yaml` dependencies following line
```
  estado: ^0.0.6
```

## A framework agnostic state management library based on MVVM
Ever felt tired of glueing your Flutter Widgets with some Provider classes? All you want to do is
write your App using a pure Flutter API. Suddenly, you have to wrap your Components with Providers
and other classes just so you can share data. Estado is a platform and framework agnostic
implementation of MVVM (Model-View-ViewModel). It separates the state of your UI and doesn't force
you to wrap your UI component classes with some annoying Providers or Controllers. It does not
perform dependency injection, Navigation or anything else for you. Need a shared state? Well make
your ViewModel class static and subscribe / unsubscribe the Widget to / from the ViewModel yourself.
All this library does is give you the tools to separate your UI State completely away from your
Views / Widgets. Your actual State class (ViewModel) is completely decoupled from Flutter and you
can 100% unit test it

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
class LoginViewModel extends ViewModel {
  
  void logIn(String email, String password) {
    // LoadingState could be a State defined in a common package or so
    notify(LoadingState(isLoading: true));
    
    authRepository.login(email, password);
    
    // let's assume login was successful
    notifyState(LoadingState(isLoading: false));
    notify(LoginSuccessfulState());
  }
}

class LoginSuccessfulState extends ViewState{
  static String name = "LoginSuccessful";

  LoginSuccessfulState() : super(name);
}

class LoginUiState extends State<LoginUi> 
with ViewModelObserver implements StateObserver {
  LoginViewModel vm = getViewModel(); // use your DI lib or own factory, its up to you
  
  void initState() {
    super.initState();
    vm.subscribe(this);
  }
  
  void deactivate() {
    super.deactivate();
    vm.unsubscribe(this);
  }
  void _handleLoginSuccessfulState(LoginSuccessfulState state) {
    this.setState({
      loggedIn: true
    });
  }

  @override
  Map<String, Function> getHandleStateFunctions() {
    return {
      LoadingState.name: (LoadingState state) => setState({isLoading: state.isLoading}),
      LoginSuccessfulState.name: _handleLoginSuccessfulState
    };
  }
}
```

## Additional information

If you wish to contribute feel free to create a PR at the github repo. For bugs or feature requests
you can create an Issue.

