import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: LoginPage())
    );
  }
}



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _statusText = "";

  void _handleLogin() {
    if (_emailController.text == "dheeraj@gmail.com" &&
        _passwordController.text == "123456") {
      setState(() {
        _statusText = "Success";
      });
    } else {
      setState(() {
        _statusText = "Fail";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: MediaQuery(data: MediaQueryData(), child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              key: ValueKey("email_field"),
              controller: _emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              key: ValueKey("password_field"),
              controller: _passwordController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _handleLogin,
              key: ValueKey('login_button'),
              child: Text("Login"),
            ),
            SizedBox(height: 16.0),
            Text(_statusText),
          ],
        ),
      ))
        ,
    );
  }
}