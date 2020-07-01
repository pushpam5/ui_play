import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,//
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 70,left: 10,right: 10),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 0, 0),
                  child: Text(
                    'Hello',
                    style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold,fontFamily: 'BenchNine',color: Colors.blue),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 130, 0, 0),
                  child: Text(
                    'There',
                    style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold,color: Colors.blue[600]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(255, 130, 0, 0),
                  child: Text(
                    '.',
                    style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold,fontFamily: 'BenchNine',color: Colors.blue[600]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:250,left: 20,right: 20),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                              fontFamily: 'BenchNine'
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)
                          ),
                          labelText: 'EMAIL'
                        ),
                      ),
                      SizedBox(height: height*0.025,),
                      TextField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                                fontFamily: 'BenchNine'
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)
                            ),
                            labelText: 'PASSWORD'
                        ),
                        obscureText: true,//hides password
                      ),
                      SizedBox(height: height*0.025,),
                      Container(
                        alignment: Alignment(1,0),
                        padding: EdgeInsets.only(top: 15,left: 20),
                        child: InkWell(
                          splashColor: Colors.grey,
                          onTap: (){},
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                                fontFamily: 'BenchNine',
                              fontSize: 18
                              )
                            ),
                          ),
                        ),
                      SizedBox(height: height*0.05,),
                      Material(
                        elevation: 7,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 60,
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue,
                          ),
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: (){
                              Navigator.of(context).pushReplacementNamed('/homepage');
                            },
                            child: Center(
                              child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      fontFamily: 'BenchNine'
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'New to this app ?',
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            splashColor: Colors.grey,
                            //onTap: ()=> _opensignuppage(context),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                  decoration:TextDecoration.underline
                              ),
                            ),
                          )
                        ],
                      )
                      ]
                  )
                )
              ],
                  ),
                )
              ],
            ),
          );
  }

}
