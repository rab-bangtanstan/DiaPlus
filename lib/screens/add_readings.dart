import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/helpers/database_helper.dart';
import 'package:travel_app/models/tracker.dart';

class AddReading extends StatefulWidget {

  final Task task;
  AddReading({this.task});


  @override
  _AddReadingState createState() => _AddReadingState();
}

class _AddReadingState extends State<AddReading> {
  final _formKey = GlobalKey<FormState>();
  String _title='';
  String _readingtypes;
  DateTime _date =DateTime.now();

  TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormatter = DateFormat('MMM dd , yyyy');
  final List<String> _readtypes = ['Before Food', 'After Food'];

  @override
  void initState()
  {
    super.initState();
    if(widget.task!=null )
      {
        _title=widget.task.title;
        _date =widget.task.date;
        _readingtypes=widget.task.readingtypes;
      }
    _dateController.text = _dateFormatter.format(_date);
  }

   @override
    void dispose ()
   {
     _dateController.dispose();
     super.dispose();
   }


  _handleDatePicker() async{
    final DateTime date = await showDatePicker(
        context: context,
        initialDate:_date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
    );

    if (date!=null && date!=_date)
      {
        setState(() {
          _date =date;
          //_dateController.text = _date.toString();

          _dateController.text = _dateFormatter.format(date);
        });

      }
  }

  _submit(){
    if(_formKey.currentState.validate())
    {
      _formKey.currentState.save();
      print('$_title,$_date, $_readingtypes');

      Task task =Task(title:_title,date:_date,readingtypes: _readingtypes);
      if(widget.task==null)
        {
          task.status=0;
          DatabaseHelper.instance.insertTask(task);
        }
      else
        {
          task.status = widget.task.status;
          DatabaseHelper.instance.updateTask(task);
        }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GestureDetector(
        onTap:() => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding:EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 30.0,
                  color: Colors.black38
                ),
              ),
                SizedBox(height:20.0),
                Text('Add Readings',
                  style: TextStyle(color: Colors.black,fontSize: 35.0,fontWeight: FontWeight.bold),
                ),
                SizedBox(height:10.0),
                Form(
                  key:_formKey,
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 18.0),
                        decoration: InputDecoration(
                            labelText: 'Blood Glucose level ',
                          labelStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                        ),
                        validator: (input) =>input.trim().isEmpty ? 'Please enter a value' :null,
                        onSaved: (input) => _title = input,
                        initialValue: _title,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        readOnly:true,
                      controller: _dateController,
                        onTap:_handleDatePicker,
                        style: TextStyle(fontSize: 18.0),
                        decoration: InputDecoration(
                            labelText: 'Date',
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                        isDense: true ,
                        icon: Icon(Icons.arrow_drop_down_circle),
                        iconSize: 28.0,
                        iconEnabledColor: Theme.of(context).primaryColor,

                        items: _readtypes.map((String readingtypes){
                          return DropdownMenuItem(
                          value: readingtypes,
                          child: Text(
                          readingtypes,
                          style: TextStyle(
                          color:Colors.black,
                          fontSize: 18.0
                    ),

                    ),
                    );
                    }).toList(),

                        style: TextStyle(fontSize: 18.0),
                        decoration: InputDecoration(
                            labelText: 'Before food / After food ',
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                        validator: (input) =>_readingtypes ==null ? 'Please enter the type of reading' :null,
                        onSaved: (input) => _readingtypes= input,
                        onChanged: (value){
                          setState(() {
                            _readingtypes=value;
                          });
                        },

                        value: _readingtypes,

                      ),
                    ),
                  Container(margin:EdgeInsets.symmetric(vertical: 20.0),
                  height:60.0,
                  width:double.infinity,
                  decoration: BoxDecoration(color:Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0)
                  )  ,
                    child: FlatButton(
                      child:Text('Add',style:TextStyle(
                        color:Colors.white,
                        fontSize: 20.0,
                      ),
                      ),
                      onPressed: _submit,
                    ),
                  ),
                  ],),
                )
            ],),
          ),
        ),
      )
      //backgroundColor: Colors.blue,
    );
  }
}
