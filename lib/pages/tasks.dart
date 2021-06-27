import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auths/controllers/authentications.dart';
import 'package:flutter_auths/main.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:intl/intl.dart';
//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
class TasksPage extends StatefulWidget {
  final String uid;
  TasksPage({Key key, @required this.uid}) : super(key: key);
  @override
  _TasksPageState createState() => _TasksPageState(uid);
}
class _TasksPageState extends State<TasksPage> {
  final String uid;
  _TasksPageState(this.uid);
  var taskcollections = Firestore.instance.collection('tasks');
  String task;
  String task1;
  // String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    task1 = '';
    _myActivityResult = '';
  }
  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = task1;
      });
    }
  }
  void showdialog(bool isUpdate, DocumentSnapshot ds) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: isUpdate ? Text("Update Data") : Text("Add Data"),
            content: Form(
              key: formkey,
              autovalidate: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: DropDownFormField(
                      titleText: 'Timing',
                      hintText: 'Please choose one',
                      value: task1,
                      onSaved: (_val) {
                        setState(() {
                          task1 = _val;
                        });
                      },
                      onChanged: (_val) {
                        setState(() {
                          task1 = _val;
                        });
                      },
                      dataSource: [
                        {
                          "display": "Morning",
                          "value": "Morning",
                        },
                        {
                          "display": "Afternoon",
                          "value": "Afternoon",
                        },
                        {
                          "display": "Evening",
                          "value": "Evening",
                        },
                        {
                          "display": "Night",
                          "value": "Night",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Sugar Level",
                      ),
                      validator: (_val) {
                        if (_val.isEmpty) {
                          return "Can't Be Empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (_val) {
                        task = _val;
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                color: Colors.purple,
                onPressed: () {
                  if (formkey.currentState.validate()) {
                    formkey.currentState.save();
                    if (isUpdate) {
                      taskcollections
                          .document(uid)
                          .collection('task')
                          .document(ds.documentID)
                          .updateData({
                        'task': task + ' mg/dl',
                        'timing': task1,
                        'time': DateTime.now(),
                      });
                    } else {
                      //  insert
                      taskcollections.document(uid).collection('task').add({
                        'task': task + ' mg/dl',
                        'timing': task1,
                        'time': DateTime.now(),
                      });
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontFamily: "tepeno",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showdialog(false, null),
        backgroundColor: Colors.lightBlue,
        child: Text(
          'ADD',
          style: TextStyle(
            fontFamily: "tepeno",
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Glucose Reading",
          style: TextStyle(
            fontFamily: "tepeno",
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => signOutUser().then((value) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false);
            }),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: taskcollections
            .document(uid)
            .collection('task')
            .orderBy('time')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      ds['task'],
                      style: TextStyle(
                        fontFamily: "tepeno",
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      ds['timing'],
                      style: TextStyle(
                        fontFamily: "tepeno",
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                    onLongPress: () {
                      // delete
                      taskcollections
                          .document(uid)
                          .collection('task')
                          .document(ds.documentID)
                          .delete();
                    },
                    onTap: () {
                      // == Update
                      showdialog(true, ds);
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return CircularProgressIndicator();
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_auths/controllers/authentications.dart';
// import 'package:flutter_auths/main.dart';
//
// class TasksPage extends StatefulWidget {
//   final String uid;
//
//   TasksPage({Key key, @required this.uid}) : super(key: key);
//
//   @override
//   _TasksPageState createState() => _TasksPageState(uid);
// }
//
// class _TasksPageState extends State<TasksPage> {
//   final String uid;
//   _TasksPageState(this.uid);
//
//   var taskcollections = Firestore.instance.collection('tasks');
//   String task;
//
//   void showdialog(bool isUpdate, DocumentSnapshot ds) {
//     GlobalKey<FormState> formkey = GlobalKey<FormState>();
//
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: isUpdate ? Text("Update Todo") : Text("Add Todo"),
//             content: Form(
//               key: formkey,
//               autovalidate: true,
//               child: TextFormField(
//                 autofocus: true,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: "Task",
//                 ),
//                 validator: (_val) {
//                   if (_val.isEmpty) {
//                     return "Can't Be Empty";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onChanged: (_val) {
//                   task = _val;
//                 },
//               ),
//             ),
//             actions: <Widget>[
//               RaisedButton(
//                 color: Colors.purple,
//                 onPressed: () {
//                   if (formkey.currentState.validate()) {
//                     formkey.currentState.save();
//                     if (isUpdate) {
//                       taskcollections
//                           .document(uid)
//                           .collection('task')
//                           .document(ds.documentID)
//                           .updateData({
//                         'task': task,
//                         'time': DateTime.now(),
//                       });
//                     } else {
//                       //  insert
//                       taskcollections.document(uid).collection('task').add({
//                         'task': task,
//                         'time': DateTime.now(),
//                       });
//                     }
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text(
//                   "Add",
//                   style: TextStyle(
//                     fontFamily: "tepeno",
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => showdialog(false, null),
//         child: Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         title: Text(
//           "Tasks",
//           style: TextStyle(
//             fontFamily: "tepeno",
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.exit_to_app),
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             onPressed: () => signOutUser().then((value) {
//               Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(builder: (context) => HomePage()),
//                   (Route<dynamic> route) => false);
//             }),
//           ),
//         ],
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: taskcollections
//             .document(uid)
//             .collection('task')
//             .orderBy('time')
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data.documents.length,
//               itemBuilder: (context, index) {
//                 DocumentSnapshot ds = snapshot.data.documents[index];
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: Colors.purple,
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                   margin: EdgeInsets.all(8.0),
//                   child: ListTile(
//                     title: Text(
//                       ds['task'],
//                       style: TextStyle(
//                         fontFamily: "tepeno",
//                         fontSize: 18.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                     onLongPress: () {
//                       // delete
//                       taskcollections
//                           .document(uid)
//                           .collection('task')
//                           .document(ds.documentID)
//                           .delete();
//                     },
//                     onTap: () {
//                       // == Update
//                       showdialog(true, ds);
//                     },
//                   ),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return CircularProgressIndicator();
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }
