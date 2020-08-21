import 'package:flutter/material.dart';
import 'package:note_keeper/model/note.dart';
import 'package:note_keeper/utils/database_helper.dart';

class NoteDetails extends StatefulWidget {
  final String noteTitle;
  final Note note;
  NoteDetails(this.note,this.noteTitle);

  @override
  _NoteDetailsState createState() => _NoteDetailsState(note,noteTitle);
}

class _NoteDetailsState extends State<NoteDetails> {
  List<String> _priorities = ['High', 'Medium', 'Low'];
  String _currentPriority = 'High';
  DatabaseHelper helper=DatabaseHelper();
  Note note;
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String noteTitle;
  _NoteDetailsState(this.note,this.noteTitle);
  @override
  Widget build(BuildContext context) {

    titleEditingController.text=note.title;
    descriptionController.text=note.description;
    return Scaffold(
      appBar: AppBar(title: Text(noteTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DropdownButton<String>(
                items: _priorities.map((String itemselected) {
                  return DropdownMenuItem<String>(
                    value: itemselected,
                    child: Text(itemselected),
                  );
                }).toList(),
                value:getPriorityAsString(note.priority),
                onChanged: (valueSelected) {
                  setState(() {
                    print('$valueSelected');
                    updatePriorityAsInt(valueSelected);
                  });
                }),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: titleEditingController,
                onChanged: (value){
                  updateTitle();
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: descriptionController,
                onChanged: (value){
                  updateDescription();
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Save'),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 4,),
                Expanded(
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Delete'),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void updatePriorityAsInt(String value)
  {
    switch(value)
    {
      case 'High':
              note.priority=1;
              break;
      case 'Medium':
              note.priority=2;
              break;
      case 'Low':
              note.priority=3;
              
    }
  }
    String getPriorityAsString(int value)
    {
      switch(value)
      {
        case 1:return _priorities[0];
        case 2:return _priorities[1];
        case 3:return _priorities[2];
      }
    }

    void updateTitle()
    {
      note.title=titleEditingController.text;
    }
    void updateDescription()
    {
      note.description=descriptionController.text;
    }
    void _save()async
    {
      MoveToLastScreen();
      int result=0;
      if(note.id!=null)
      {
        result=await helper.updateNote(note);
      }
      else{
        result=await helper.insertNote(note);
      }
      if(result!=0)
      {
        _showAlertDialog('STATUS','Note Saved Successfully');
      }
      else
      {
        _showAlertDialog('STATUS','Problem occurred');
      }
    }
    _showAlertDialog(String title,String message)
    {
      AlertDialog alertDialog=AlertDialog(
        title: Text(title),
        content: Text(message),
      );
      showDialog(context: context,builder:(_)=>alertDialog );
    }
  }

