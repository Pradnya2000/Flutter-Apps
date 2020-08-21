import 'package:flutter/material.dart';
import 'package:note_keeper/notedetails.dart';
import 'dart:async';
import 'package:note_keeper/model/note.dart';
import 'package:note_keeper/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null){ 
      noteList = List<Note>();
      updateListView();  
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: 'Add Note',
        onPressed: () {
          print('tappedd on floating');
          navigateToDetails(Note('','','',3),'Add Note');
        },
      ),
    );
  }

  ListView getListView() {
    return ListView.builder(
      itemCount: _count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor:
                    getPriotityColor(this.noteList[position].priority),
                child: Icon(Icons.arrow_right)),
            title: Text(this.noteList[position].title),
            subtitle: Text(this.noteList[position].date),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: (){
                _delete(context, noteList[position]);
              },
            ),
            onTap: () {
              print('tappeddd');
              navigateToDetails(this.noteList[position],'Edit Note');
            },
          ),
        );
      },
    );
  }



  Color getPriotityColor(int priority) {
    if (priority == 1)
      return Colors.red;
    else if (priority == 2)
      return Colors.yellow;
    else
      return Colors.green;
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.delNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void updateListView()
  {
    final Future<Database> dbFuture=databaseHelper.initializeDatabase();
    dbFuture.then((database){
        Future<List<Note>> noteListFuture=databaseHelper.getNoteList();
        noteListFuture.then((notelist) {
          setState(() {
            this.noteList=notelist;
            this._count=notelist.length;
          });
        } );
    });
  }
  void navigateToDetails(Note note,String title)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteDetails(note,title);
    }));
  }
}
