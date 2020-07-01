import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import './loader.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  File newFile = null;
  String path='No file Added( only .xlsx files)';
  var val = null;
  bool loading = false;


  Future<String> _uploadFile(String file) async {

  String url = 'https://backendswadeshi.herokuapp.com/uploadfile';
  try {
    setState(() {
      loading = true;
    });
    var request = await http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('uploadfile', file));
    var res = await request.send();
    var response = await http.Response.fromStream(res);

//  var response = json.decode(res.reasonPhrase);
    var jsonresponse = json.decode(response.body);

    print(jsonresponse['data']);
    setState(() {
      loading = false;
    });
    return jsonresponse['data'];
  }
  on SocketException{
    setState(() {
      loading = false;
    });
      val= "Please Connect To Internet";
      return val;
  }
}



  Future selectFile() async {
    File temp = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['xlsx','xls'],
    );
    temp.path.contains('.xlsx') || temp.path.contains('.xls')?
    setState(() {
      newFile = temp;
      path = newFile.path;
    })
        :
            showDialog(
                context: context,
              builder: (context) => AlertDialog(
                content: Text('Please Select .xlsx or .xls format files',style: TextStyle(color:Colors.red,fontFamily: 'BenchNine'),),
              )
            );
}
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    return loading ? Loader(): Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('File app',style: TextStyle(fontFamily: "BenchNine"),),
        actions: [
          FlatButton(
            onPressed: selectFile,
            child: Text(
              'Add File',
              style: TextStyle(
              fontSize: 18,
                color: Colors.white,
                fontFamily: "BenchNine"
            ),),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height/4,),
            Text("Selected File",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'BenchNine',fontWeight: FontWeight.bold),)
            ,Padding(
              padding: const EdgeInsets.fromLTRB(5,18,2,18),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10)
                ),
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                              path,
                        style: TextStyle(
                          fontSize: 20, fontFamily: 'BenchNine'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Material(
              elevation: 7,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () async {
                    if(newFile != null){
                      val= await _uploadFile(newFile.path);
                      if (val == null){
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text('There\'s an error while uploading file please try again',style: TextStyle(color:Colors.red,fontFamily: 'BenchNine'),),
                            )
                        );
                      }
                      else if (val == "Please Connect To Internet"){
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(val,style: TextStyle(color:Colors.red,fontFamily: 'BenchNine'),),
                            )
                        );
                      }
                      else if (val != null){
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(val,style: TextStyle(color: Colors.green,fontFamily: 'BenchNine'),),
                              actions: [
                                FlatButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(
                                    'ok',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                      fontFamily: 'BenchNine'
                                    ),
                                  ),
                                )
                              ],
                            )
                        );
                      }
                  }
                    else{
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content:Text('Please Select File',style: TextStyle(color: Colors.red,fontFamily: "BenchNine"
                            ),) ,
                          )
                      );
                    }
                    }
                  ,
                  child: Center(
                    child: Text(
                        'Upload File',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BenchNine',
                            fontSize: 15
                        )
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
