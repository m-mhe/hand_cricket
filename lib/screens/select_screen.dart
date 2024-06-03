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
        leading: Icon(Icons.videogame_asset),
        title: Text('Select Overs and Wickets'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Color(0xff607C3C),
                      title: Text(
                        'What is Hand Cricket?',
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Text(
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          'Hand cricket is a game played by many school kids for fun. It uses the concepts of cricket and played with hands. Hand Cricket is a game in which two players show scores on their respective fingers. If the scores are equal, the batsman is declared out.'),
                      actions: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Color(0xff607C3C),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK')),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.help))
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
                      icon: Icon(Icons.horizontal_rule_rounded)),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: TextField(
                        controller: _tEcOver,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        enabled: false,
                        decoration: InputDecoration(
                          prefixText: 'No. of Over: ',
                        ),
                      )),
                  IconButton(onPressed: _addOver, icon: Icon(Icons.add)),
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
                      icon: Icon(Icons.horizontal_rule_rounded)),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: TextField(
                        controller: _tEcWicket,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        enabled: false,
                        decoration: InputDecoration(
                          prefixText: 'No. of wicket: ',
                        ),
                      )),
                  IconButton(onPressed: _addWicket, icon: Icon(Icons.add)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
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
