
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class score extends StatelessWidget {
  final double bmiscore;
  final int age;
  String? bmistatus;
  String? bmiInterpetation;
  Color? statusColor;
  score({ Key? key,required this.bmiscore,required this.age }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setbmiInterpetation();
    return Scaffold(
      appBar: AppBar(
       title: Text("BMI Score"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        ),
        body: Container(
         
          padding: EdgeInsets.all(12),
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your score",style: TextStyle(fontSize: 30,color: Colors.blue),),
                PrettyGauge(
                  gaugeSize: 300,
                  minValue: 0,
                  maxValue: 40,
                  segments: [
                    GaugeSegment("Under Weight", 18.5, Colors.red),
                    GaugeSegment("Normal", 6.4, Colors.green),
                    GaugeSegment("Over Weight", 5, Colors.yellow),
                    GaugeSegment("Obese", 10.1, Colors.pink),
                  ],
                  valueWidget: Text(
                    bmiscore.toStringAsFixed(1),style: TextStyle(fontSize: 20),
                  ),
                  currentValue: bmiscore.toDouble(),
                ),
                SizedBox(height: 20,),
                Text(bmistatus!,style: TextStyle(fontSize: 20,color: Colors.grey),),

                SizedBox(height: 10,),
                Text(bmiInterpetation!,style: TextStyle(fontSize: 20,color: Colors.black),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                       Navigator.pop(context);
                    },
                     child: Text("Re-Calculate") ),
                     SizedBox(width: 10,),
                     ElevatedButton(onPressed: (){
                      Share.share("Your BMI is ${bmiscore.toStringAsFixed(1)} at age $age");
                     },
                     child: Text("Share") )
                  ],
                )
                
              ]))),
    );
  }
  void setbmiInterpetation(){
    if(bmiscore > 30)
    {
      bmistatus = "Obese";
      bmiInterpetation = "Please reduse your obesity";
      statusColor = Colors.pink;
    }
     else if(bmiscore >= 25)
    {
      bmistatus = "OverWeight";
      bmiInterpetation = "DO regular Exercise & reduce the weight";
      statusColor = Colors.orange;
    }
     else if(bmiscore >= 18.5)
    {
      bmistatus = "Normal";
      bmiInterpetation = "Enjoy ,You are fit";
      statusColor = Colors.green;
    }
     else if(bmiscore < 18.5)
    {
      bmistatus = "UnderWeiget";
      bmiInterpetation = "Try to incrace the weight";
      statusColor = Colors.red;
    }
  }
}