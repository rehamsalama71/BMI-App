import 'package:flutter/material.dart';

class AgeCounter extends StatefulWidget {
  const AgeCounter({super.key, required this.onAgeChanged});
  final Function(int) onAgeChanged;
  @override
  State<AgeCounter> createState() => _AgeCounterState();
}

class _AgeCounterState extends State<AgeCounter> {
  int value = 20;
  void add() {
    setState(() {
      value++;
         widget.onAgeChanged(value);
    });
  }

  void subtract() {
    if (value < 1) {
      return;
    }
    setState(() {
      value--;
       widget.onAgeChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {
            add();
          },
          mini: true,
          child: Icon(Icons.add),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          '$value',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 15,
        ),
        FloatingActionButton(
          onPressed: () {
            subtract();
          },
          mini: true,
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}
