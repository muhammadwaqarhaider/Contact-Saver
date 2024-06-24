import 'package:contacts_saver/view/screens/home/date_time_piker.dart';
import 'package:contacts_saver/view/screens/home/home_screen.dart';
import 'package:contacts_saver/view/widget/custom_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My APP"),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.purple,
            child: ListView(
              children: [
                DrawerHeader(child: Center(child: Text("Logo",style: TextStyle(fontSize: 30),)),),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Contacts Saver"),
                  onTap: (){
                    Get.to(HomeScreen());
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomeScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.timelapse),
                  title: Text("Date and Time"),
                  onTap: (){
                    Get.to(DateTimePiker());
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomeScreen()));
                  },
                )
              ],
            ),
          ),
        ),

        body: Column(
          children:  [
            const TabBar(tabs: [
              Tab(icon: Icon(Icons.home,color: Colors.cyanAccent,),),
              Tab(icon: Icon(Icons.settings,color: Colors.orangeAccent,),),
              Tab(icon: Icon(Icons.person,color: Colors.lightGreenAccent,),),
            ],),
             Expanded(
               child: TabBarView(children: [
                 CustomTab(name: "MY APP",color: Colors.white,),
                 CustomTab(name: "MY APP",color: Colors.white,),
                 CustomTab(name: "MY APP",color: Colors.white,),
               ]),
             ),

          ],
        ),
      ),
    );
  }
}
