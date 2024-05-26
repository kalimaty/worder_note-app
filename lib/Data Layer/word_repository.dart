import 'package:shared_preferences/shared_preferences.dart';

class WordRepository {
  Future<List<String>> loadWords() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedWords = prefs.getStringList('words');
    return savedWords ?? [];
  }

  Future<void> saveWords(List<String> words) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('words', words);
  }
}
