import 'package:login_exm/home_screen/home_screen.dart';
import 'package:login_exm/reg_screen/reg_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final emailformKey=GlobalKey<FormState>();
  final passwordformKey=GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back,color: Colors.black,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                  Center(
                    child: Text("Sign in to Your Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 33),),
                  ),
                  SizedBox(height: 30,),
            
                  Form(
                    key: emailformKey,
                    child: TextFormField(
                       decoration: InputDecoration(
                        hintText:"Your Email Address " ,
                        border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         
                        ),
                       ),
                       validator: (value) {
                         if(value!=null && value.contains("@")){
                          return null;
                         }else{
                          return "Enter a valid email";
                         }
                       },
                    ),
                  ),
                  SizedBox(height: 20,),
                    Form(
                      key: passwordformKey,
                      child: TextFormField(
                        obscureText: true,
                        obscuringCharacter: "*",
                       decoration: InputDecoration(
                        hintText:"Your Password " ,
                        suffixIcon: Icon(Icons.visibility_off),
                        border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         
                        ),
                       ),
                          validator: (value) {
             if (value==null || value.isEmpty){
              return "enter a valid password";
             }
             if(value.length<7){
              return "password should be at least 7 characters";
             }else{
              return null;
             }
                     },
                                      ),
                    ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_box_outlined,color: Colors.black,),
                          SizedBox(width: 3,),
                          Text("Remember Me",style: TextStyle(color: Colors.black),),
                          SizedBox(width: 110,),
                                        
                        ],
                      ),
                      TextButton(onPressed: (){}, 
                          child: Text("Forgot Password",style: TextStyle(color: Colors.blue),)),  
                    ],
                  ),
                  SizedBox(height: 25,),
                      ElevatedButton(
                        onPressed: (){
                       if(emailformKey.currentState!.validate() &&
                       passwordformKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                       }
                        }, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue.shade800),
                          padding: MaterialStateProperty.all(EdgeInsets.all(18)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)
                            ))
                        ),
                      child: Center(child: Text("Sign in",style: TextStyle(
                      fontSize: 15),),
                      )),
                    
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't you have an account?"),
                TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegScreen()));
                }, child: Text("Sign Up",style: TextStyle(color: Colors.blue),))
              ],
            )
          ],
        ),
        
      ),
    );
  }
}