import 'package:flutter/material.dart';
import 'package:graduation/presentation/auth/sign_up.dart';

import '../brain/home.dart';

class Login extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    return Form(
      key: _formkey,
      child: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 140,
                    height: 113,
                    child: Image(image:AssetImage('images/1.png'), )),
                Text(
                  'Hello Again!',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) => _email= value,
                      validator: (value) => value!.isEmpty ?'Enter a Valid Email': null,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          labelText: 'Email'),
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) => _password= value,
                      validator: (value) => value!.length <6 ?'Your password must be larger than 6 characters': null,
                      obscureText: true,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          labelText: 'Password'),
                      keyboardType: TextInputType.number,
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(50.0)),
                    child: MaterialButton(
                        child: Text('Login',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                        onPressed: (){
                          if(_formkey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(builder:(context) => Detect(),));
                          };
                        }
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(50.0)),
                    child: MaterialButton(
                        child: Text('Sign Up',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context) => SignUp(),));

                        }
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account yet?"),
                    SizedBox(width: 10.0,),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                    }, child: Text('Sign Up'))
                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}