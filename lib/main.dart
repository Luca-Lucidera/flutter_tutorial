import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade300,
      padding: const EdgeInsets.only(left: 30, top: 20),
      child: Column(
        children: [
          Text(
            "Ciao1",
            textDirection: TextDirection.ltr,
          ),
          Text(
            "Ciao2",
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}
