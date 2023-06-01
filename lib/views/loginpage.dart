import 'dart:convert';
import 'package:projekan/views/register.dart';
import 'package:flutter/material.dart';
import 'koneksi.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'menu_utama.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key,}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  String username = "";
  String password = "";
  bool isLoginSuccess = true;
  bool isUsername = true;
  bool isPassword = true;
  var Username_controller = TextEditingController();
  var Password_controller = TextEditingController();

  void _loginNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.login),
        body:{
          "username" : Username_controller.text.trim(),
          "password" : Password_controller.text.trim(),
        },
      );
      if(res.statusCode == 200)
      {
        var resBodyOfLogin = jsonDecode(res.body);
        if (resBodyOfLogin['success'] == true) {
          Fluttertoast.showToast(msg: "Login success!");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) {
                return MainMenu();
              }
              )
          );
        } else {
          Fluttertoast.showToast(msg: "Login failed, please write the correct username or password...");
        }
      }
    }catch(e){
      print("error = " + e.toString());
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Login'),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/food.png'),
              radius: 50,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 300,
              height: 40,
              child: TextFormField(
                onChanged: (value) {
                  username = value;
                }, decoration: InputDecoration(hintText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 40,
              child: TextFormField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 40,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                  primary: (isLoginSuccess) ? Colors.blueAccent : Colors.grey
              ),
                onPressed: () {
                  Username_controller.text = username;
                  Password_controller.text = password;
                  print(Username_controller.text);
                  if (Username_controller.text != "" &&
                      Password_controller.text != "" ) {
                    _loginNow();
                  } else {
                    SnackBar snackBar = SnackBar(
                      content: Text("Tidak Boleh Ada Yang Kosong"),
                      backgroundColor: Colors.blue[900],
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }, child: Text('Login'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(onPressed: () {},
                child: const Text('Forgot Password?',
                    style: TextStyle(color: Colors.grey))
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context){
                          return signup();
                        })
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}




