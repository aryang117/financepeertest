import 'package:flutter/material.dart';

import 'data.dart';

class DataPage extends StatelessWidget {
  const DataPage({Key? key, required this.z}) : super(key: key);

  final List<Data> z;

  @override
  Widget build(BuildContext context) {
    //debug
    print('z length is' + z.length.toString());

    //debug
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
