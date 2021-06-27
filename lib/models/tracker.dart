class Task
{
  int id;
  String title;
  String readingtypes;
  DateTime date;
  int status;

  Task({this.readingtypes,this.title,this.date,this.status});
  Task.withId({this.id,this.readingtypes,this.title,this.date,this.status});

  Map<String,dynamic> toMap(){
    final map = Map<String,dynamic>();
    if(id!=null){
      map['id'] = id;
    }

    map['title'] = title;
    map['date'] = date.toIso8601String();
    map['readingtypes'] = readingtypes;
    map['status'] = status;

    return map;
  }

  factory Task.fromMap(Map<String,dynamic> map){
    return Task.withId(
        id: map['id'],
        title: map['title'],
        date:DateTime.parse(map['date']),
        readingtypes: map['readingtypes'],
        status:map['status']);
  }
}