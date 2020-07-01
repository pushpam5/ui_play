
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  File newFile;
  String path='No file Added';

  void selectFile() async {
    File temp = await FilePicker.getFile();
    setState(() {
      newFile = temp;
      path = newFile.path;
    });
}
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('File app'),
        actions: [
          FlatButton(
            onPressed: selectFile,
            child: Text(
              'Add File',
              style: TextStyle(
              fontSize: 18,
                color: Colors.white
            ),),
          )
        ],
      ),
      body: Center(
        child: Text(
                path,
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
