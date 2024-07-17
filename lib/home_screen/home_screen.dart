import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_exm/view/login_screen/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
    Navigator.push(context, 
    MaterialPageRoute(builder: (context) =>LoginScreen() ) );
        }, icon: Icon(Icons.logout,color: Colors.black,))
      ]),
      body: Center(
        child: Text("Home Page",
        style: TextStyle(
          fontWeight: FontWeight.bold,color: Colors.black,
          fontSize: 20),),
      ),
    );
  }
}