import 'package:flutter/material.dart';
import 'dart:math';

import 'package:hand_cricket/screens/select_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen(
      {super.key, required this.totalOver, required this.totalWicket});

  final int totalOver;
  final int totalWicket;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final TextEditingController _tEcAi = TextEditingController();
  final TextEditingController _tEcTarget = TextEditingController();
  final TextEditingController _tEcTotalRun = TextEditingController();
  final TextEditingController _tEcPlayer = TextEditingController();
  final TextEditingController _tEcCurrentGameState = TextEditingController();
  int _PlayertotalBall = 0;
  int _PlayertotalWicket = 0;
  int _target = 0;
  int _PlayertotalRuns = 0;
  bool _isUserTurn = true;
  int _AitotalRuns = 0;
  int _AitotalBall = 0;
  int _AitotalWicket = 0;

  void _upDateCurrentGameState(int ball, int wicket) {
    _tEcCurrentGameState.text =
        "Total wicket remain: $wicket, Total ball remain $ball";
  }

  void _userInput(int playerTurn) {
    Random randomizer = Random();
    _tEcPlayer.clear();
    _tEcPlayer.text = playerTurn.toString();
    int aiTurn = randomizer.nextInt(7);
    if (_isUserTurn == true) {
      _tEcAi.clear();
      _tEcAi.text = aiTurn.toString();
      if (aiTurn != playerTurn) {
        _PlayertotalRuns += playerTurn;
        _PlayertotalBall--;
        if (_PlayertotalBall <= 0) {
          _isUserTurn = false;
          _target = _PlayertotalRuns + 1;
          _PlayertotalRuns = 0;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'You are balling now.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ));
        }
      } else {
        _PlayertotalWicket--;
        _PlayertotalBall--;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'One wicket gone!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        ));
        if (_PlayertotalWicket == 0 || _PlayertotalBall == 0) {
          _isUserTurn = false;
          _target = _PlayertotalRuns + 1;
          _PlayertotalRuns = 0;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'You are balling now.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ));
        }
      }
    } else if (_isUserTurn == false) {
      _tEcAi.clear();
      _tEcAi.text = aiTurn.toString();
      if (aiTurn != playerTurn) {
        _AitotalRuns += aiTurn;
        _AitotalBall--;
        if (_AitotalBall == 0) {
          if (_AitotalRuns == (1 - _target)) {
            _tEcCurrentGameState.dispose();
            _tEcTotalRun.dispose();
            _tEcTarget.dispose();
            _tEcPlayer.dispose();
            _tEcAi.dispose();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text(
                      'The match is draw',
                      style: TextStyle(color: Colors.green[700]),
                    ),
                    content: Text(
                        style:
                            TextStyle(color: Colors.green[700], fontSize: 16),
                        'Do You want to play another match?'),
                    actions: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff607C3C),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return SelectScreen();
                            }), (route)=> false);
                          },
                          child: Text('OK')),
                    ],
                  );
                });
          } else if (_AitotalRuns <= _target) {
            _tEcCurrentGameState.dispose();
            _tEcTotalRun.dispose();
            _tEcTarget.dispose();
            _tEcPlayer.dispose();
            _tEcAi.dispose();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Color(0xff607C3C),
                    title: Text(
                      'Congratulation!',
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Text(
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        'You Won! do You want to play another match?'),
                    actions: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xff607C3C),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                                  return SelectScreen();
                                }), (route)=> false);
                          },
                          child: Text('OK')),
                    ],
                  );
                });
          } else if (_AitotalRuns >= _target) {
            _tEcCurrentGameState.dispose();
            _tEcTotalRun.dispose();
            _tEcTarget.dispose();
            _tEcPlayer.dispose();
            _tEcAi.dispose();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.red,
                    title: Text(
                      'You Lose!',
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Text(
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        'You Lose! do You want to play another match?'),
                    actions: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                                  return SelectScreen();
                                }), (route)=> false);
                          },
                          child: Text('OK')),
                    ],
                  );
                });
          }
        } else if (_AitotalRuns >= _target) {
          _tEcCurrentGameState.dispose();
          _tEcTotalRun.dispose();
          _tEcTarget.dispose();
          _tEcPlayer.dispose();
          _tEcAi.dispose();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.red,
                  title: Text(
                    'You Lose!',
                    style: TextStyle(color: Colors.white),
                  ),
                  content: Text(
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      'You Lose! do You want to play another match?'),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                                return SelectScreen();
                              }), (route)=> false);
                        },
                        child: Text('OK')),
                  ],
                );
              });
        }
      } else {
        _AitotalWicket--;
        _AitotalBall--;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'One wicket done!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ));
        if (_AitotalWicket == 0 || _AitotalBall == 0) {
          if (_AitotalRuns == (1 - _target)) {
            _tEcCurrentGameState.dispose();
            _tEcTotalRun.dispose();
            _tEcTarget.dispose();
            _tEcPlayer.dispose();
            _tEcAi.dispose();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text(
                      'The match is draw',
                      style: TextStyle(color: Colors.green[700]),
                    ),
                    content: Text(
                        style:
                            TextStyle(color: Colors.green[700], fontSize: 16),
                        'Do You want to play another match?'),
                    actions: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff607C3C),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                                  return SelectScreen();
                                }), (route)=> false);
                          },
                          child: Text('OK')),
                    ],
                  );
                });
          } else if (_AitotalRuns <= _target) {
            _tEcCurrentGameState.dispose();
            _tEcTotalRun.dispose();
            _tEcTarget.dispose();
            _tEcPlayer.dispose();
            _tEcAi.dispose();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Color(0xff607C3C),
                    title: Text(
                      'Congratulation!',
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Text(
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        'You Won! do You want to play another match?'),
                    actions: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xff607C3C),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                                  return SelectScreen();
                                }), (route)=> false);
                          },
                          child: Text('OK')),
                    ],
                  );
                });
          }
        } else if (_AitotalRuns >= _target) {
          _tEcCurrentGameState.dispose();
          _tEcTotalRun.dispose();
          _tEcTarget.dispose();
          _tEcPlayer.dispose();
          _tEcAi.dispose();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.red,
                  title: Text(
                    'You Lose!',
                    style: TextStyle(color: Colors.white),
                  ),
                  content: Text(
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      'You Lose! do You want to play another match?'),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                                return SelectScreen();
                              }), (route)=> false);
                        },
                        child: Text('OK')),
                  ],
                );
              });
        }
      }
    }
    _tEcTarget.text = _target.toString();
    if (_isUserTurn == true) {
      _tEcTotalRun.text = _PlayertotalRuns.toString();
      _upDateCurrentGameState(_PlayertotalBall, _PlayertotalWicket);
    } else {
      _tEcTotalRun.text = _AitotalRuns.toString();
      _upDateCurrentGameState(_AitotalBall, _AitotalWicket);
    }
  }

  @override
  void initState() {
    super.initState();
    _PlayertotalBall = widget.totalOver * 6;
    _PlayertotalWicket = widget.totalWicket;
    _AitotalBall = widget.totalOver * 6;
    _AitotalWicket = widget.totalWicket;
    _upDateCurrentGameState(_PlayertotalBall, _PlayertotalWicket);
  }

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
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    controller: _tEcAi,
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
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        controller: _tEcTotalRun,
                        enabled: false,
                      )),
                ),
                Text(
                  ": RUNS",
                  style: TextStyle(
                      color: Color(0xff607C3C),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                Text(
                  "TARGET :",
                  style: TextStyle(
                      color: Color(0xff607C3C),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                      width: MediaQuery.sizeOf(context).width / 4,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        controller: _tEcTarget,
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
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    controller: _tEcPlayer,
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
                      onPressed: () => _userInput(0),
                      child: Text('0'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () => _userInput(1),
                      child: Text('1'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () => _userInput(2),
                      child: Text('2'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () => _userInput(3),
                      child: Text('3'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () => _userInput(4),
                      child: Text('4'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () => _userInput(5),
                      child: Text('5'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ElevatedButton(
                      onPressed: () => _userInput(6),
                      child: Text('6'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                controller: _tEcCurrentGameState,
                enabled: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
