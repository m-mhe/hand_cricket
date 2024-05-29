import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.videogame_asset),
        title: Text('Hand Cricket'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Color(0xff607C3C),
                      title: Text('What is Hand Cricket?', style: TextStyle(color: Colors.white),),
                      content: Text(
                        style: TextStyle(color: Colors.white, fontSize: 16),
                          'Hand cricket is a game played by many school kids for fun. It uses the concepts of cricket and played with hands. Hand Cricket is a game in which two players show scores on their respective fingers. If the scores are equal, the batsman is declared out.'),
                      actions: [
                        ElevatedButton(
                          style:ElevatedButton.styleFrom(
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
            Text(
              "AI",
              style: TextStyle(
                  color: Color(0xff607C3C),
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  child: TextField(
                    enabled: false,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                      width: MediaQuery.sizeOf(context).width / 4,
                      child: TextField(
                        enabled: false,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                      width: MediaQuery.sizeOf(context).width / 4,
                      child: TextField(
                        enabled: false,
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  child: TextField(
                    enabled: false,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Wrap(
                spacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('0'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('1'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('2'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('3'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('4'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('5'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('6'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
