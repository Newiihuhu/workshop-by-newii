import 'package:flutter/material.dart';

import '../constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(color: lightColor, fontSize: 64),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            width: size.width * 0.8,
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(30)),
            child: TextFormField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                  icon: Icon(Icons.person, color: primaryColor),
                  hintText: "Your Email",
                  border: InputBorder.none),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            width: size.width * 0.8,
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(30)),
            child: TextFormField(
              cursorColor: primaryColor,
              obscureText: showPassword,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: primaryColor),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                        color: primaryColor),
                  ),
                  hintText: "Your Password",
                  border: InputBorder.none),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("LOGIN",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                )),
          )
        ],
      ),
    );
  }
}
