import 'package:contacts_saver/model/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimePiker extends StatefulWidget {
  const DateTimePiker({Key? key}) : super(key: key);

  @override
  State<DateTimePiker> createState() => _DateTimePikerState();
}

class _DateTimePikerState extends State<DateTimePiker> {
  String date="";
  String time="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text("Date and Time Piker",style: interExtraBold,),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
            Text(date,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
            Text("Select Date & Time",style: TextStyle(fontSize: 30),),
            ElevatedButton(
                onPressed: () async {
                  DateTime? datepiked= await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025));
                   if(datepiked!=null){
                     date="${datepiked.day}/${datepiked.month}/${datepiked.year}";
                     print("date Selected: ${datepiked.day}/${datepiked.month}/${datepiked.year}");
                   };
                  setState(() {});
                },
                child: Text("date")),
            ElevatedButton(
                onPressed: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dial,
                  );
                  if(pickedTime!=null){
                    time="${pickedTime.hour}:${pickedTime.minute}";
                    print("Time Selected: ${pickedTime.hour}_${pickedTime.minute}");
                  }
                  setState(() {});
                },
                child: Text("Time"))
          ],
        ),
      ),
    );
  }
}
