import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:worder/Data%20Layer/word_repository.dart';

enum TtsState { playing, stopped }

class WordsProvider with ChangeNotifier {
  List<String> _words = [];
  final FlutterTts _flutterTts = FlutterTts();
  final WordRepository _wordRepository = WordRepository();
  TtsState _ttsState = TtsState.stopped;
  String _currentWord = '';

  List<String> get words => _words;
  TtsState get ttsState => _ttsState;
  String get currentWord => _currentWord;

  WordsProvider() {
    _loadWords();
    _initializeTts();
  }

  Future<void> _initializeTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.8);
    await _flutterTts.setSpeechRate(0.5);

    // Assign a handler to complete the speech
    _flutterTts.setCompletionHandler(() {
      _ttsState = TtsState.stopped;
      _currentWord = '';
      notifyListeners();
    });

    _flutterTts.setCancelHandler(() {
      _ttsState = TtsState.stopped;
      _currentWord = '';
      notifyListeners();
    });

    _flutterTts.setErrorHandler((msg) {
      _ttsState = TtsState.stopped;
      _currentWord = '';
      notifyListeners();
    });
  }

  Future<void> _loadWords() async {
    _words = await _wordRepository.loadWords();
    notifyListeners();
  }

  Future<void> _saveWords() async {
    await _wordRepository.saveWords(_words);
  }

  Future<void> speak(String word) async {
    if (_ttsState == TtsState.stopped) {
      _currentWord = word;
      _ttsState = TtsState.playing;
      notifyListeners();
      await _flutterTts.speak(word);
    } else if (_ttsState == TtsState.playing && _currentWord == word) {
      await _flutterTts.stop();
      _ttsState = TtsState.stopped;
      notifyListeners();
    }
  }

  void addWord(String word) {
    _words.add(word);
    _saveWords();
    notifyListeners();
  }

  void editWord(int index, String newWord) {
    _words[index] = newWord;
    _saveWords();
    notifyListeners();
  }

  void deleteWord(int index) {
    _words.removeAt(index);
    _saveWords();
    notifyListeners();
  }

  bool isPlaying(String word) {
    return _ttsState == TtsState.playing && _currentWord == word;
  }
}
