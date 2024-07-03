import 'package:flutter/material.dart';

class BottomSheetMaker extends StatefulWidget {
  RangeValues selectedRange;
  BottomSheetMaker({super.key, required this.selectedRange});

  @override
  State<BottomSheetMaker> createState() => _BottomSheetMakerState();
}

class _BottomSheetMakerState extends State<BottomSheetMaker> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
          children:[
            RangeSlider(
              min:0,
              max:100,
              values: widget.selectedRange,
              activeColor: Colors.red,
              inactiveColor: Colors.blue,
              divisions: 100,
              labels: RangeLabels(widget.selectedRange.start.round().toString(),widget.selectedRange.end.round().toString()),
              onChanged: (RangeValues value) {
                setState((){
                  widget.selectedRange=value;
                });
              },
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop(widget.selectedRange);
                },
                child: Text("Update")
            )
          ]
      ),
    );;
  }
}
