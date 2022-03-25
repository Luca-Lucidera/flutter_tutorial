import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material app",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //scaffold = impalcatura
    return Scaffold(
      appBar: AppBar(title: const Text("Posizionamento")),
      body: Container(
        padding: const EdgeInsets.all(16),
        //contiene tutto
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Titolo login
            Container(
              child: const Text("Login"),
              margin: const EdgeInsets.only(bottom: 16.0),
            ),

            //Username e input
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: const Text("USERNAME"),
                    margin: const EdgeInsets.only(right: 20),
                  ),
                  const Flexible(
                    child: TextField(),
                  ),
                ],
              ),
              margin: const EdgeInsets.only(bottom: 8.0),
            ),

            //Password e input
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: const Text("PASSWORD"),
                    margin: const EdgeInsets.only(right: 20),
                  ),
                  const Flexible(
                    child: TextField(
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                    ),
                  ),
                ],
              ),
              margin: const EdgeInsets.only(bottom: 16.0),
            ),

            //Bottone login
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                    child: const Text("LOGIN!"), onPressed: () => {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void lezioniFinoAlla12() {
//Container è come se fosse un div
  Container(
      color: Colors.green.shade300,
      margin: const EdgeInsets.only(top: 26),
      padding: const EdgeInsets.all(16),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: const Text(
              "Testo breve",
              textDirection: TextDirection.ltr,
            ),
          ),
          Container(
            color: Colors.red,
            child: const Text(
              "Testo abbastanza lungo",
              textDirection: TextDirection.ltr,
            ),
          ),
          Container(
            color: Colors.yellow,
            child: const Text(
              "Testo meno breve",
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ));
}
