import 'package:flutter/material.dart';
import 'contact_me.dart';
import 'detection.dart';
import 'info.dart';

class Detect extends StatefulWidget {
  @override
  State<Detect> createState() => _DetectState();
}

class _DetectState extends State<Detect> {
  int currentIndex=0;
  List <Widget> screens=
  [
    Detection(),
    Info(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Contact()));
        },
        child: Image(image: AssetImage('images/1.png'),width:100,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
            print(index);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.addchart),
            label: 'Detect',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.perm_contact_cal_outlined),
            label: 'About us',
          ),
        ],
      ),
      body:screens[currentIndex],
    );
  }
}