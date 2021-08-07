import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth.dart';
import 'package:todo_app/todo_card.dart';

class Home extends StatefulWidget {
  final uid ;
  const Home({Key? key, this.uid}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
  var tasksList;
  var username;
  var email;

  TextEditingController _c = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef.child("${widget.uid}").child("tasks").once().then((DataSnapshot data){
      setState(() {
        tasksList = data.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(username == null){
      dbRef.child("${widget.uid}").child("name").once().then((DataSnapshot data){
        setState(() {
          username = data.value;
        });
      });
    }
    if(tasksList == null){
      tasksList = [];
    }
    if(email == null){
      dbRef.child("${widget.uid}").child("email").once().then((DataSnapshot data){
        setState(() {
          email = data.value;
        });
      });
    }
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return SingleChildScrollView(
                  child: Dialog(
                    insetPadding: EdgeInsets.fromLTRB(40, 100, 40, 400),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter Task to be Added",
                            ),
                            controller: _c,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                child: ElevatedButton(
                                  onPressed: (){
                                    setState(() {
                                      _c.clear();
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                child: ElevatedButton(
                                    onPressed: (){
                                      setState(() {
                                        DateTime now = DateTime.now();
                                        String dateNow = "${now.day.toString().padLeft(2,'0')}/${now.month.toString().padLeft(2,'0')}/${now.year.toString()}";
                                        String timeNow = "${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";
                                        var taskDetails = {
                                          "task" : _c.text,
                                          "date" : dateNow,
                                          "time" : timeNow,
                                        };
                                        tasksList.add(taskDetails);
                                        _c.clear();
                                        updateDb();
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text("Save"),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      appBar: AppBar(
        title: Text("$username's To-Do List"),
        backgroundColor: Colors.deepPurpleAccent,
        actions: <Widget>[
          IconButton(
              onPressed:(){
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
                });
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index){
          return Todo(
              task: tasksList[index]["task"],
              date: tasksList[index]["date"],
              time: tasksList[index]["time"],
              delete: (){
                tasksList.remove(tasksList[index]);
              },
              update: updateDb,
          );
        },
      )
    );
  }

  void updateDb(){
    setState(() {
      dbRef.child("${widget.uid}").set(
          {
            "email" : email,
            "name" : username,
            "tasks": tasksList,
          });
    });
  }
}
