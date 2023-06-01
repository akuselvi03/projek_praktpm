import 'dart:convert';
import 'package:projekan/views/loginpage.dart';
import 'package:projekan/views/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'koneksi.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bool _isLoad = false;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = false;
  }

  void _onRegister() async {
    User userModel = User(
      1,
      usernameController.text.trim(),
      passwordController.text.trim(),
    );
    try
    {
      var res = await http.post(
        Uri.parse(API.signUp),
        body : userModel.toJson(),
      );
      if(res.statusCode == 200){
        var resBodyOfSignUp = jsonDecode(res.body);
        if(resBodyOfSignUp['success'] == true){
          Fluttertoast.showToast(msg: "Sign up success!");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => loginpage(),
            ),
          );
        }else{
          Fluttertoast.showToast(msg: "Sign up failed...");
        }
      }
    }
    catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.blue[900],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: _isLoad
          ? const Center(
          child: CircularProgressIndicator()
      )
          : SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: Stack(
                  children: <Widget>[


                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Create your account here",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: TextFormField(

                              controller: usernameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username is required';
                                }
                                return null;
                              },
                              style: TextStyle(
                                  color: Colors.black
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              obscureText: !_isPasswordVisible,
                              controller: passwordController,
                              style: TextStyle(
                                  color: Colors.black
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },

                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              obscureText: !_isPasswordVisible,
                              controller: confirmPasswordController,
                              style: TextStyle(
                                  color: Colors.black
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Confirm Password is required';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width/1,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:Color.fromRGBO(49, 39, 79, 1),
                          shape: StadiumBorder(),

                        ),
                        onPressed: () { print(usernameController.text);
                        if (usernameController.text != "" &&
                            passwordController.text != "" &&
                            confirmPasswordController.text != "") {
                          if (passwordController.text != confirmPasswordController.text) {
                            SnackBar snackBar = SnackBar(
                              content: Text(
                                  "Password dan Konfirmasi Password harus sama !"),
                              backgroundColor: Colors.redAccent,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            _onRegister();
                          }
                        } else {
                          SnackBar snackBar = SnackBar(
                            content: Text("Tidak Boleh Ada Yang Kosong"),
                            backgroundColor: Colors.redAccent,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } },
                        child: Text('REGISTER'),

                      ),
                    ),


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
