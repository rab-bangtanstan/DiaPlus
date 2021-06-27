import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/models/tracker.dart';
import 'package:travel_app/screens/add_readings.dart';
import 'package:travel_app/helpers/database_helper.dart';

class GlucoseTracker extends StatefulWidget {
  @override
  _GlucoseTrackerState createState() => _GlucoseTrackerState();
}

class _GlucoseTrackerState extends State<GlucoseTracker> {

  Future<List<Task>> _taskList;
  final DateFormat _dateFormatter = DateFormat('MMM dd , yyyy');

  @override
  void initState()
  {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList()
  {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
    });
  }

  Widget _buildTask(Task task){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children:<Widget> [
          ListTile(
            title: Text(task.title,
            style: TextStyle(
              fontSize: 18.0,
              decoration: task.status==0
                ?TextDecoration.none:TextDecoration.lineThrough,
            ),),
            subtitle: Text('${_dateFormatter.format(task.date)} * ${task.readingtypes}'),
            trailing: Checkbox(onChanged: (value){
              task.status=value?1:0;
              DatabaseHelper.instance.updateTask(task);
              _updateTaskList();

              //print(value);

            },
              activeColor: Theme.of(context).primaryColor,
              value:true,

            ),

            onTap:()=>Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_)=>AddReading(

              ))
            )
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor, // creates a floating round button
        child:Icon(Icons.add),  //creates a plus sign
        // onPressed: ()=>print("Navigate baby.."),
        onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>AddReading(), //connects to the add_readings.dart
        ),),
      ),


      body: FutureBuilder(
        future:_taskList,
        builder:(context,snapshot){
          if(!snapshot.hasData)
            {
              return Center(
                //child:CircularProgressIndicator(),
              );
            }

        final int completedTaskCount = snapshot.data
            .where((Task task )=>task.status==1)
            .toList()
            .length;

        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical:conDefaultPad*4),

          //itemCount:10,
            itemCount:1+snapshot.data.length,
            itemBuilder: (BuildContext context,int index){
            if(index==0){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: conDefaultPad*2,vertical: conDefaultPad),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Glucose Levels',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0,),
                    Text('$completedTaskCount of ${snapshot.data.length}',
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],

                ),
              );
            }
            // return _buildTask(index);
              return _buildTask(snapshot.data[index-1]);
            },
    );
  },
      ),
    );
  }
}
