import 'package:login_exm/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_exm/view/login_screen/login_screen.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailformKey=GlobalKey<FormState>();
  final passwordformKey=GlobalKey<FormState>();
  final confirmpassformKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmController=TextEditingController();
  
  final String email="abc2003@gmail.com";
  final String password="1234567";
  
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
                    child: Text("Sign Up for Free",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 33),),
                  ),
                  SizedBox(height: 30,),

                  Form(
                    key: emailformKey,
                    child: TextFormField(
                      controller: emailController,
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
                        controller: passwordController,
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
                  SizedBox(height: 20,),
                    Form(
                      key: confirmpassformKey,
                      child: TextFormField(
                        controller: confirmController,
                        obscureText: true,
                        obscuringCharacter: "*",
                       decoration: InputDecoration(
                        hintText:"Your Confirm Password " ,
                        suffixIcon: Icon(Icons.visibility_off),
                        border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         
                        ),
                       ),
                       validator: (value) {
                         if(value==null || value.isEmpty){
                         return "enter a valid password";
                         }
                         if(value!=passwordController.text){
                          return "password doesn't match";
                         }
                       },
                                      ),
                    ),
                  SizedBox(height: 30,),
                 
                      ElevatedButton(
                        onPressed: (){
                       if(emailformKey.currentState!.validate() &&
                       passwordformKey.currentState!.validate() &&
                        confirmpassformKey.currentState!.validate()){
                        if( emailController.text==email &&
                        passwordController.text==password){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                       }};
                        }, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue.shade800),
                          padding: MaterialStateProperty.all(EdgeInsets.all(18)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)
                            ))
                        ),
                      child: Center(child: Text("Sign Up",style: TextStyle(
                      fontSize: 15),),
                      )),
                    
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                }, child: Text("Sign In",style: TextStyle(color: Colors.blue),))
              ],
            )
          ],
        ),
        
      ),
    );
  }
}