import 'dart:ui';

import 'package:flutter/material.dart';

class ageweight extends StatefulWidget {
  final Function(int) onChange;
  final int min;
  final int max;
  final String title;
  final int intValue;  
  const ageweight({ Key? key ,required this.onChange,
  required this.intValue,
  required this.max,
  required this.min,
  required this.title}) : super(key: key);

  @override
  State<ageweight> createState() => _ageweightState();
}

class _ageweightState extends State<ageweight> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.intValue;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(),
              child: Column(
                 children: [
                  Text(widget.title,style: TextStyle( fontSize: 20,color: Colors.grey),),
                  SizedBox(width: 
                  10,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                          child:  CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.remove,color: Colors.white,),
                        ),
                        onTap: () {
                          setState(() {
                            if(counter>widget.min){
                              counter--;
                            }
                          });

                          widget.onChange(counter);
                        },
                        ),
                        SizedBox(width: 15,),
                        Text(counter.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                        SizedBox(width: 15,),

                        InkWell(
                          child:  CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.add,color: Colors.white,),
                        ),
                        onTap: () {
                          setState(() {
                            if(counter<widget.max){
                              counter++;
                            }
                          });

                          widget.onChange(counter);
                        },
                        ),
                      
                      ],
                    ),
                  )
                 ]
              ),
           )
         );
  }
}