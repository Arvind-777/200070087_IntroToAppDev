import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var appBarTitle = "Log In to Continue";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(child: LogInForm()),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var appBarTitle = "Sign Up To Continue";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(child: SignUpForm()),
    );
  }
}


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key : _formKey,
      child: SingleChildScrollView(
        child: Column(
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
                maxLength: 15,
                validator: (value){
                  if (value!.isEmpty){
                    return "Please Enter Username";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return "Please Enter Email";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return "Please Enter a Password";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent)),
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    registerToFb();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                  child: Text("Sign Up"),
                ),
            ),
            SizedBox(
                height: 20.0,
            ),
            GestureDetector(
              child: Text("Already have an account?",style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LogInScreen()));
              },
            )

          ],
        ),
      ),
    );
  }
  
  void registerToFb(){
    var uid;
    firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ).then((value) {
      uid = value.user!.uid;
      dbRef.child(value.user!.uid).set(
        {
          "email" : emailController.text,
          "name" : nameController.text,
          "tasks": [],
        }
      ).then((res){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(uid : uid)));
      });
    }).catchError((err){
      print(err);
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
      );
    });
  }

  @override
  void dispose(){
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key : _formKey,
      child: SingleChildScrollView(
        child: Column(
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return "Please enter your registered Email";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return "Please enter your Password";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent)),
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  logInToFb();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: Text("Login"),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              child: Text("Not a member",style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
              },
            )
          ],
        ),
      ),
    );
  }

  void logInToFb(){
    var uid;
    firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ).then((value){
      uid = value.user!.uid;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(uid : uid)));
    }).catchError((err){
      print(err);
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
      );
    });
  }
}
