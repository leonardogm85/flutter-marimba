import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MarimbaApp());

class MarimbaApp extends StatelessWidget {
  const MarimbaApp({
    Key? key,
  }) : super(key: key);

  final Map<int, Color> _notes = const {
    1: Colors.teal,
    2: Colors.blue,
    3: Colors.yellow,
    4: Colors.red,
    5: Colors.grey,
    6: Colors.purple,
    7: Colors.brown,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: _notes.entries
                .map(
                  (note) => Note(
                    note: note.key,
                    color: note.value,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class Note extends StatelessWidget {
  const Note({
    Key? key,
    required this.note,
    required this.color,
  }) : super(key: key);

  final int note;
  final Color color;

  void _onTap() {
    final audioCache = AudioCache();
    audioCache.play('audios/note$note.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
