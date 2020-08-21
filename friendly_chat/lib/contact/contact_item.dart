import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friendly_chat/contact/contactmodal.dart';

class ContactItem extends StatelessWidget {
  ContactModal _contactModal;
  ContactItem(this._contactModal);
  List<Color> colors=[Colors.blue,Colors.red,Colors.teal,Colors.yellow,Colors.pink,Colors.purple];
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: colors[Random().nextInt(colors.length)],
        child: Text(_contactModal.fullName[0])
      ),
      title: Text(_contactModal.fullName),
      subtitle: Text(_contactModal.email),
    );
  }
}
