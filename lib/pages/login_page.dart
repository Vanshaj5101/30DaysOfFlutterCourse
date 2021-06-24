import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(
        Duration(seconds: 1),
      );
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).canvasColor,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Image.asset(
                    "assets/images/LoginImage.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $userName",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          userName = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "UserName cannot be Empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter UserName",
                          labelText: "UserName",
                          hintStyle: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                          labelStyle: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          hintStyle: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                          labelStyle: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password length should be atleast 6";
                            }

                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                        borderRadius: changeButton
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(10),
                        color: Theme.of(context).buttonColor,
                        child: InkWell(
                          // splashColor: Colors.deepOrangeAccent,
                          onTap: () {
                            moveToHome(context);
                          },
                          child: AnimatedContainer(
                            width: changeButton ? 50 : 120,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                            duration: Duration(seconds: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
