import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iconly/iconly.dart';
import 'package:worder/Application%20Layer/word_provider.dart';

class WordListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordsProvider = Provider.of<WordsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'WorderNoteApp',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: wordsProvider.words.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    margin: EdgeInsets.all(10),
                    color: Color.fromARGB(255, 20, 180, 250),
                    child: ListTile(
                      title: Text(wordsProvider.words[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              wordsProvider.speak(wordsProvider.words[index]);
                            },
                            icon: Icon(
                              size: 50,
                              color: Colors.white,
                              wordsProvider
                                      .isPlaying(wordsProvider.words[index])
                                  ? Icons.pause
                                  : IconlyLight.play,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () =>
                                _showEditWordDialog(context, index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => wordsProvider.deleteWord(index),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _showAddWordDialog(context),
              child: Text('Add Word'),
              style: ElevatedButton.styleFrom(
                
                backgroundColor: Color.fromARGB(255, 50, 180, 250),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void _showAddWordDialog(BuildContext context) {
    final wordsProvider = Provider.of<WordsProvider>(context, listen: false);
    String newWord = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a new word'),
          content: TextField(
            onChanged: (value) {
              newWord = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter a new word',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (newWord.isNotEmpty) {
                  wordsProvider.addWord(newWord);
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditWordDialog(BuildContext context, int index) {
    final wordsProvider = Provider.of<WordsProvider>(context, listen: false);
    TextEditingController _controller =
        TextEditingController(text: wordsProvider.words[index]);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit word'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Edit the word',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                String editedWord = _controller.text;
                if (editedWord.isNotEmpty) {
                  wordsProvider.editWord(index, editedWord);
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
