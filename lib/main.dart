import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

TextEditingController usernameController = TextEditingController();
TextEditingController passowrdController = TextEditingController();
TextField usernameTextField = TextField(controller: usernameController);
TextField passwordTextField = TextField(
  obscureText: true,
  autocorrect: false,
  enableSuggestions: false,
  controller: passowrdController,
);

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
      appBar: AppBar(
        title: const Text("Posizionamento"),
        backgroundColor: Colors.red,
      ),
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
                  Flexible(
                    child: usernameTextField,
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
                  Flexible(
                    child: passwordTextField,
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
                  child: const Text("LOGIN!"),
                  onPressed: () {
                    checkCredential().then((response) => {
                          if (response.statusCode == 200)
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SecondRoute()))
                            }
                        });
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

Future<http.Response> checkCredential() async {
  String host = "http://192.168.1.95:8080/login";
  var client = await http.Client();
  bool ok = false;
  return client.post(
    Uri.parse(host),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': 'mornatta@gmail.com',
      'password': 'mornatta1234'
    }),
  );
}

void secondFunction(prova) {
  debugPrint('$prova');
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
