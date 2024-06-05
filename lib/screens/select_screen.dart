import 'package:flutter/material.dart';
import 'package:hand_cricket/screens/game_screen.dart';

class SelectScreen extends StatelessWidget {
  SelectScreen({super.key});

  final TextEditingController _tEcOver = TextEditingController(text: '1');
  final TextEditingController _tEcWicket = TextEditingController(text: '1');

  void _addOver() {
    _tEcOver.text = (int.parse(_tEcOver.text) + 1).toString();
  }

  void _subOver() {
    if (int.parse(_tEcOver.text) > 1) {
      _tEcOver.text = (int.parse(_tEcOver.text) - 1).toString();
    }
  }

  void _subWicket() {
    if (int.parse(_tEcOver.text) > 1) {
      _tEcWicket.text = (int.parse(_tEcWicket.text) - 1).toString();
    }
  }

  void _addWicket() {
    _tEcWicket.text = (int.parse(_tEcWicket.text) + 1).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.videogame_asset),
        title: const Text('Select Overs and Wickets'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color(0xff607C3C),
                      title: const Text(
                        'What is Hand Cricket?',
                        style: TextStyle(color: Colors.white),
                      ),
                      content: const Text(
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          'Hand cricket is a game played by many school kids for fun. It uses the concepts of cricket and played with hands. Hand Cricket is a game in which two players show scores on their respective fingers. If the scores are equal, the batsman is declared out.'),
                      actions: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xff607C3C),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK')),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.help))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: _subOver,
                      icon: const Icon(Icons.horizontal_rule_rounded)),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: TextField(
                        controller: _tEcOver,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        enabled: false,
                        decoration: const InputDecoration(
                          prefixText: 'No. of Over: ',
                        ),
                      )),
                  IconButton(onPressed: _addOver, icon: const Icon(Icons.add)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: _subWicket,
                      icon: const Icon(Icons.horizontal_rule_rounded)),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: TextField(
                        controller: _tEcWicket,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        enabled: false,
                        decoration: const InputDecoration(
                          prefixText: 'No. of wicket: ',
                        ),
                      )),
                  IconButton(onPressed: _addWicket, icon: const Icon(Icons.add)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return GameScreen(
                          totalOver: int.parse(_tEcOver.text),
                          totalWicket: int.parse(_tEcWicket.text),
                        );
                      },
                    ),
                  );
                },
                child: const Text('SELECT'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
