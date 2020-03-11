import 'package:flutter/material.dart';
import 'package:note_app/DBHelper.dart';

import 'Listnote.dart';
import 'NotePage.dart';

void main()=>runApp(new Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Simple Note',
      debugShowCheckedModeBanner: false,
      home: new MyHomepage(),

    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  var db=new DBHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.note_add,color: Colors.white,),

          backgroundColor: Colors.blue,

          onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder:
          (BuildContext context)=>new NotePage(null,true))),
      ),
      appBar: AppBar(
        leading: Icon(Icons.edit),
        title: Text('Simple Note',style: TextStyle(color: Colors.white,
            fontSize: 25.0,fontWeight:FontWeight.w500),),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: db.getNote(),
        builder: (context,snapshot){
          if(snapshot.hasError)
            print(snapshot.error);
          var data=snapshot.data;

          return snapshot.hasData
              ? new NoteList(data)
              :Center(
            child:Text("No Data"),
          );
        },
      ),
    );
  }
}

