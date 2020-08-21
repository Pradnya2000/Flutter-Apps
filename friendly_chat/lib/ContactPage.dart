import 'package:flutter/material.dart';
import 'package:friendly_chat/contact/contact_item_list.dart';

import 'contact/contactmodal.dart';

class ContactPage extends StatelessWidget {
  _createData()
  {
    return <ContactModal>[
       ContactModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
       ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
       ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
       ContactModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
       ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
       ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
       ContactModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
       ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
       ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
    ];

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ContactITemList(_createData()),
      
    );
  }
}