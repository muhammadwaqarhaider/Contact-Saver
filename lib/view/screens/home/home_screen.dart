import 'package:contacts_saver/model/contact.dart';
import 'package:contacts_saver/view/widget/contacts_item.dart';
import 'package:contacts_saver/view/widget/search_box.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contactList = [];
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu,color: tdBlack,size: 30,),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/man.png"),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                SearchBox(
                  onChanged: (val) {
                    contactList=contactList.where((element) => element.name.contains(val)).toList();
                    setState(() {

                    });
                  },
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40,bottom: 20),
                        child: Text("Cotacts Saver",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),

                      ),
                      for(Contact contact in contactList.reversed)
                        ContactsItem(
                          contact: contact,
                          onDeleteItem: (con){
                            contactList.remove(con);
                            setState(() {

                            });
                          },
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 238,
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            right: 20,
                            left: 20,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0,0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                          onChanged: (contact){contactList;},
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: "Add Name",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 238,
                          margin: const EdgeInsets.only(
                            bottom: 20,
                            right: 20,
                            left: 20,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0,0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: numberController,
                            decoration: const InputDecoration(
                              hintText: "Add contact",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 110,
                  margin: EdgeInsets.only(bottom: 20,right: 20),
                  child: ElevatedButton(
                    child: Text("+",style: TextStyle(fontSize: 40),),
                    onPressed: ()  async {
                      contactList.add(Contact(name: nameController.text, number: numberController.text));
                      print(contactList.first);
                      var sharedpref = await SharedPreferences.getInstance();
                      
                      setState(() {});
                      nameController.clear();
                      numberController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),


    );
  }


  }


