import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:financepeerflutter/data.dart';
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
  Future<void> _incrementCounter() async {
    List z = [];

    List<Data> z1 = [];
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['json']);

    if (result != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.size);

      final x = file.bytes!.asMap();

      String y = String.fromCharCodes(file.bytes!);
      z = json.decode(y);

      for (dynamic i in z) {
        Data newData = Data(
            id: i['id'],
            userId: i['userId'],
            body: i['body'],
            title: i['title']);

        z1.add(newData);

        // http.post(Uri.parse('http://127.0.0.1:8000/notes/create/'),
        //     body: <String, dynamic>{
        //       'id1': newData.id,
        //       'userId': newData.userId,
        //       'body': newData.body,
        //       'title': newData.title
        //     }).then((value) => print(value.statusCode));

        //  print(i['id'].toString() + ' ' + i['title']);
        //  print('\n');
      }
    }
    // setState(() {
    //   _counter++;
    // });

    //print(z);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DataPage(z: z1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DataPage extends StatelessWidget {
  const DataPage({Key? key, required this.z}) : super(key: key);

  final List<Data> z;

  @override
  Widget build(BuildContext context) {
    print('z length is' + z.length.toString());

    print('z element' + z.first.toString());
    return Scaffold(
      body: ListView.builder(
          itemCount: z.length,
          itemBuilder: (context, index) {
            Data newData = z.elementAt(index);
            return Center(
              child: Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: 400,
                  child: ListTile(
                    leading: Text(newData.id.toString()),
                    title: Text(newData.title.toString()),
                    subtitle: Text(newData.body),
                    trailing: Text("UserID:" + newData.userId.toString()),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
