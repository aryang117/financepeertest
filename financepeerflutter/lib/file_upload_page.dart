import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'data.dart';
import 'data_view_page.dart';

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({Key? key}) : super(key: key);

  @override
  _FileUploadPageState createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  Future<void> _filePick() async {
    List z = [];

    List<Data> z1 = [];
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['json'], withData: true);

    if (result != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.size);
      print(file.bytes);

      //final x = file.bytes!.asMap();

      String y = String.fromCharCodes(file.bytes ?? [1, 1]);
      z = json.decode(y);

      for (dynamic i in z) {
        Data newData = Data(
            id: i['id'],
            userId: i['userId'],
            body: i['body'],
            title: i['title']);

        z1.add(newData);

        final postData = jsonEncode(newData);
        print(postData);

        await http.post(Uri.parse('http://127.0.0.1:8000/notes/create/'),
            body: postData.toString(),
            headers: {'Content-Type': 'application/json'});

        //print(i['id'].toString() + ' ' + i['title']);
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
      body: Center(
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: MaterialButton(
            onPressed: _filePick,
            shape: const RoundedRectangleBorder(side: BorderSide()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Select File to Upload'),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20)),
                Icon(Icons.upload_file_outlined)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
