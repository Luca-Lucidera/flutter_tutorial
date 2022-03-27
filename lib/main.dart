// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

TextEditingController emailController = TextEditingController();
TextEditingController passowrdController = TextEditingController();
TextField emailTextField = TextField(controller: emailController);
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          navBar(context),
          Column(
            children: [
              Text("Post 1"),
              Text("Post 2"),
            ],
          ),
        ],
      ),
    );
  }
}

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final x = getUser();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          navBar(context),
        ],
      ),
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
                    child: const Text("EMAIL"),
                    margin: const EdgeInsets.only(right: 51),
                  ),
                  Flexible(
                    child: emailTextField,
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
                          log(response.body.toString()),
                          if (response.statusCode == 200)
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const UserProfile()))
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

//funzioni da utilizzare nelle pagine
Future<http.Response> checkCredential() async {
  String host = "http://192.168.1.201:8080/login";
  var client = http.Client();
  log(emailController.text + " " + passowrdController.text);
  return client.post(
    Uri.parse(host),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': emailController.text,
      'password': passowrdController.text
    }),
  );
}

Row navBar(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      //Home
      Container(
        padding: const EdgeInsets.only(top: 45),
        child: ElevatedButton(
          onPressed: () {},
          child: const Icon(
            Icons.home,
            color: Colors.black,
            size: 45.0,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            onPrimary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
        ),
      ),
      //Mappa
      Container(
        padding: const EdgeInsets.only(top: 45),
        child: ElevatedButton(
          onPressed: () {},
          child: const Icon(
            Icons.map,
            size: 45.0,
            color: Colors.black,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            onPrimary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
        ),
      ),
      //User
      Container(
        padding: const EdgeInsets.only(top: 45),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: const Icon(
            Icons.person,
            size: 45.0,
            color: Colors.black,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            onPrimary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
        ),
      ),
    ],
  );
}

void getUser() async {
  String host = "http://192.168.1.201:8080/user";
  var client = http.Client();
  log(emailController.text + " " + passowrdController.text);
  client.get(
    Uri.parse(host),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6ImMzNjEyZGM1LWFkNTQtMTFlYy1hMjhkLWUwZDU1ZWU0NzJhNyIsImlhdCI6MTY0ODM0MTA1OCwiZXhwIjoxNjQ4MzQ4MjU4fQ.bM3LPNF0ZzcRjp0SO_zHZQWLdw_1XgQ8kXhES9xcLGk"
    },
  );
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
