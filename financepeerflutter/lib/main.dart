import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:financepeerflutter/data.dart';
import 'package:financepeerflutter/file_upload_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Welcome'),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text('Enter Username'),
                    hintText: 'abcd',
                    border: OutlineInputBorder()),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text('Enter Password'),
                    hintText: '****',
                    border: OutlineInputBorder()),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
              ),
              MaterialButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FileUploadPage()));
                },
                child: const SizedBox(
                  width: 300,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
