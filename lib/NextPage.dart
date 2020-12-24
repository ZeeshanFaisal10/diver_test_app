import 'package:diver_test_app/ItemAddNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '2NextPage.dart';

class NextPage extends StatefulWidget {
  final  stDate;
  final  enDate;

  NextPage({this.stDate, this.enDate});


  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {

  int diffCount;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("${widget.stDate}"),
          Text("${widget.enDate}"),

          // MaterialButton(onPressed: (){
          //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScndNextPage(stDate: "${widget.stDate}",enDate: "${widget.enDate}",)));
          //
          // },
          // child: Text("Add Hotel"),
          // color: Colors.red,
          // ),

          MaterialButton(
              color: Colors.blue,
              child: Text("Add Activity"),
              onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScndNextPage(stDate: widget.stDate,enDate: widget.enDate,)));

          }),

          Consumer<ItemAddNotifier>(builder: (context,itemAddNotifier,_){
            return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: itemAddNotifier.itemList.length,
                itemBuilder: (BuildContext ctx, int index){
                  return Container(
                    margin: EdgeInsets.only(top: 5),
                    child: ListTile(
                      onTap: (){
                      },
                      tileColor: Colors.blue,
                      title: Text("${itemAddNotifier.itemList[index].hname}"),
                      subtitle: Text("${itemAddNotifier.itemList[index].hdate}"),
                    ),
                  );
                });
          })
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    diffCount = DateTime.parse(widget.enDate).difference(DateTime.parse(widget.stDate)).inDays;
    print("count is : $diffCount");
  }
}
