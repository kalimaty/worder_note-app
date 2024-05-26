# worder

A new Flutter project.

## Getting Started
A Flutter application using Clean Architecture for managing and speaking sight words. It includes state management with Provider, data persistence with SharedPreferences, and text-to-speech functionality with flutter_tts. The app allows users to add, edit, delete, and listen to words.




![10](https://github.com/kalimaty/worder_note-app/assets/105967966/189a7911-1291-42b8-9b02-3b8b97f31617)



![11](https://github.com/kalimaty/worder_note-app/assets/105967966/cb6a789a-5a4e-4fc0-b6cb-a0df8003a985)




![13](https://github.com/kalimaty/worder_note-app/assets/105967966/b20deed3-f121-457a-906a-0d5df8395871)



![14](https://github.com/kalimaty/worder_note-app/assets/105967966/6a21a9d8-a549-45da-9c25-e09405330b80)




Description of the software and application architecture

Architecture used: Clean Architecture

Clean Architecture is a method of designing software that organizes code into layers so that each component has specific, assigned responsibilities. The main goal of this engineering is to make the system more maintainable, testable, and expandable.
Layers used in the application:

     Presentation Layer:
         It contains screens and user interfaces (UI).
         It contains the front-end code and interactions with the user.

     Application Layer:
         Contains data providers and state management.
         It is concerned with implementing business logic and invoking data services.

     Domain Layer:
         It contains models and business rules.
         It includes the basic entities that express application data.

     Data Layer:
         It contains data warehouses (repositories) that handle storage.
         It deals with operations that call data from or store data in external data sources (such as SharedPreferences).

Programming flow chart

     Start application:
         The application is started from main.dart which initializes the ChangeNotifierProvider for the data provider WordsProvider.
         SightWordsCoach is the main widget that contains the MaterialApp and sets the WordListScreen as the main interface.

     Presentation Layer:
         WordListScreen is a widget that displays a list of words.
         The user interacts with the user interface through buttons to add, edit or delete words, as well as play audio.
         Provider is used to fetch data from WordsProvider and display it.

     Application Layer:
         WordsProvider is a class that uses ChangeNotifier to manage state and provide data.
         It contains a word list and functions to add, edit and delete words.
         Contains logic to control text-to-speech conversion using FlutterTts.
         WordsProvider loads words from WordRepository upon initialization.

     Domain Layer:
         Word class expresses the basic entity of a word.

     Data Layer:
         WordRepository contains functions to load and store words from SharedPreferences.



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
