import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../brain/home.dart';

class SignUp extends StatelessWidget{
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    return Form(
      key: _formkey,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700,color: Colors.lightBlue),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Welcome To Brain Tumor'
                ,
                style: TextStyle(fontSize: 20.0,color: Colors.blueGrey),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        labelText: 'Enter your name'),
                  )),
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) => _password= value,
                    validator: (value) => value!.length <6 ?'Your password must be larger than 6 characters': null,
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        labelText: 'Conferm Password'),
                    keyboardType: TextInputType.number,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(50.0)),
                  child: MaterialButton(
                      child: Text('Sign Up',style: TextStyle(fontSize: 20.0,color: Colors.white)),
                      onPressed: (){
                        if(_formkey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder:(context) => Detect(),));
                        };
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}