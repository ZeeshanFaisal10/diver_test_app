import 'package:diver_test_app/Item.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:provider/provider.dart';

import 'ItemAddNotifier.dart';


class ScndNextPage extends StatefulWidget {
  final stDate;
  final enDate;

  ScndNextPage({this.stDate, this.enDate});
  @override
  _ScndNextPageState createState() => _ScndNextPageState();
}

class _ScndNextPageState extends State<ScndNextPage> {

  List<Item> finList;

  String hotel_Sel;
  var temp;
  List hotels =[
    "Mehran Hotel",
    "Taj Hotel",
    "Avari Hotel",
    "Pearl Hotel",
  ];


  @override
  void initState() {
    super.initState();
    temp = DateTime.parse(widget.stDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Select Hotel :"),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(

                itemCount: hotels.length,
                itemBuilder: (
                BuildContext context, int index){
              return ListTile(
                onTap: (){
                  setState(() {
                    hotel_Sel = hotels[index].toString();
                  });
                },
                title: Text(hotels[index]),
              );
            }),
          ),

          Text("${hotel_Sel}"),
          MaterialButton(
              color: Colors.deepOrangeAccent,
              onPressed: () async {
                final List<DateTime> picked = await DateRagePicker.showDatePicker(
                    context: context,
                    initialFirstDate: temp,
                    initialLastDate: DateTime.parse(widget.enDate),
                    firstDate: new DateTime(2020),
                    lastDate: new DateTime(2050),

                );
                if (picked != null && picked.length == 2) {
                  temp = picked.last;

                  if(hotel_Sel != null){
                    Provider.of<ItemAddNotifier>(context,listen: false).addItem(hotel_Sel,"${picked}");
                    //finList.add(Item("${hotel_Sel}", "${picked}"));
                   // print(finList[0]);
                  }

                 // initialD = "${picked.first}";
                 // finalD = "${picked.last}";
                }
              },
              child: new Text("Pick date range")
          ),
          MaterialButton(
              color: Colors.blue,
              child: Text("Reserved"),
              onPressed: (){
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
