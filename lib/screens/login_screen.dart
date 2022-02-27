import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/user_model.dart';
import '../services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;
  String email = "";
  String password = "";
  late UserModel user;

  Future<UserModel> login(String email, String password) async {
    this.user = await LoginService(email, password);
    if (user.email.isNotEmpty) {
      print("pass");
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Colors.grey.shade300,
              title: Text("ไม่สามารถเข้าสู่ระบบได้"),
              content: Text("กรุณาตรวจสอบข้อมูล"),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "ตกลง",
                      style: TextStyle(color: lightColor),
                    ))
              ],
            );
          });
    }
    return this.user;
  }

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
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
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
              onChanged: (value) {
                password = value;
              },
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
                  onPressed: () {
                    login(email, password);
                  },
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
