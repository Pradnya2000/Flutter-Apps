import 'package:flutter/material.dart';
import 'package:friendly_chat/contact/contact_item.dart';

import 'contactmodal.dart';

class ContactITemList extends StatelessWidget {
   
  List<ContactModal> _contactmodallist;
  ContactITemList(this._contactmodallist);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:_buildListOfWidgets(),
      
    );
  }
  List<ContactItem> _buildListOfWidgets()
  {
    return _contactmodallist.map((eachitem) => ContactItem(eachitem)).toList();
  }
}
