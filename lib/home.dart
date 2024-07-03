import 'package:flutter/material.dart';
import "bottomSheetMaker.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  RangeValues rangevalues=RangeValues(0,0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Value from bottom modal sheet"),
      ),
      body:Center(
        child: Column(
          children:[
            SizedBox(height:20),
            Text("Range: ${rangevalues.start.round()} - ${rangevalues.end.round()}"),
            SizedBox(height:5),
            ElevatedButton(
                onPressed: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => BottomSheetMaker(selectedRange: rangevalues),
                  ).then((value){
                    rangevalues=value;
                    setState((){});
                  });
                },
                child: Text("Select Range"),
            )
          ]
        ),
      ),
    );
  }
}