import 'package:contacts_saver/model/contact.dart';
import 'package:flutter/material.dart';

import '../../model/utils/colors.dart';

class ContactsItem extends StatelessWidget {
  final Contact contact;
  final onDeleteItem;
   ContactsItem({Key? key, required this.contact,  this.onDeleteItem,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(vertical:5,horizontal: 20 ),
        tileColor: Colors.white,
        leading: Image.asset("assets/images/man.png"),
        title: Text(
          contact.name,
          style: const TextStyle(color: tdBlack,fontSize: 16),
        ),
        subtitle: Text(
          contact.number,
          style: const TextStyle(color: tdBlack,fontSize: 16),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),

          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(contact);
            },
          ),
        ),
      ),
    );
  }
}
