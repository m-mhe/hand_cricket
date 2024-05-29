import 'package:flutter/material.dart';
import 'package:hand_cricket/screens/game_screen.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.horizontal_rule_rounded)),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width/3,
                      child: TextField(enabled: false,decoration: InputDecoration(labelText: "No. of wicket:"),)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.horizontal_rule_rounded)),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width/3,
                      child: TextField(enabled: false, decoration: InputDecoration(labelText: "No. of wicket:"),)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return GameScreen();
              },),);},
                child: const Text('SELECT'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
