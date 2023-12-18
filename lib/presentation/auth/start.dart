import 'package:flutter/material.dart';
import 'package:graduation/presentation/auth/sign_up.dart';
import '../../widgets.dart';
import 'login.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 150,
                child: Image(
                    image: AssetImage(
                      'images/2.png',
                    )),
              ),
              Text(
                'Brain Tumor',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightBlue),
              ),
              Text(
                'A new way of detection',
                style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: defaultButton(
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      },
                      text: "Login")),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: defaultButton(
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                      },
                      text: "Sign up")),
            ],
          ),
        ));
  }
}
