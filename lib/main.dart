import 'package:diver_test_app/ItemAddNotifier.dart';
import 'package:diver_test_app/NextPage.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context){
    return ItemAddNotifier();
  },
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApplication(),
  ),
  ));

}

class MyApplication extends StatefulWidget {
  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {

  String initialD,finalD;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MaterialButton(
              color: Colors.deepOrangeAccent,
              onPressed: () async {
                final List<DateTime> picked = await DateRagePicker.showDatePicker(
                    context: context,
                    initialFirstDate: new DateTime.now(),
                    initialLastDate: new DateTime.now(),
                    firstDate: new DateTime(2020),
                    lastDate: new DateTime(2050)
                );
                if (picked != null && picked.length == 2) {
                 initialD = "${picked.first}";
                 finalD = "${picked.last}";
                }
              },
              child: new Text("Pick date range")
          ),

          MaterialButton(onPressed: (){
            if(initialD != null && finalD != null){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => NextPage(stDate: initialD,enDate: finalD,)));
            }
          },
          color: Colors.orangeAccent,
          child: Text("Next Page"),
          ),
        ],
      ),
    );
  }
}
