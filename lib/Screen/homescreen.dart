import 'dart:math';

import 'package:bmiadhoc/Screen/scorescreen.dart';
import 'package:bmiadhoc/widget/ageweight.dart';
import 'package:bmiadhoc/widget/genderwidget.dart';
import 'package:bmiadhoc/widget/height.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class home extends StatefulWidget {
  const home({ Key? key }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _gender = 0, _height =150,_age=30,_weight=50;
  bool _isFinished = false;
  double _bmiresult = 0 ;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CaLcUlAtOr"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        ),
      backgroundColor: Colors.grey,  
      body: SingleChildScrollView(
        child: Container(
         
          padding: EdgeInsets.all(12),
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(),
            child: Column(
              children: [
                genderwidget(onChange:(genderval){
                  _gender = genderval;
                },
               ),
               height(onChange: (heightval){
                _height = heightval;
               },),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   ageweight(onChange: (agevalue){
                      _age =agevalue;
                   }, intValue: 30, 
                   max: 100,
                    min: 0,
                     title: "Age"),
                  ageweight(onChange: (weightvalue){
                      _weight = weightvalue;
                   }, intValue: 50, 
                   max: 200,
                    min: 0,
                     title: "Weight(kg)"),
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 60),
                 child: SwipeableButtonView(
                  isFinished:_isFinished ,
                  onFinish: ()async{
                    await Navigator.push(context,PageTransition(child: score(
                      bmiscore: _bmiresult, age: _age), type: PageTransitionType.fade) );
                    setState(() {
                         _isFinished = false;
                       });
                  },
                  onWaitingProcess: (){
                    calculateBMI();
                    Future.delayed(Duration(seconds: 1),(){
                       setState(() {
                         _isFinished = true;
                       });
                    });
                  }, 
                  activeColor: Colors.amber, 
                  buttonWidget: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,), 
                  buttonText: "CALCULATE"),
               )
              ],
            ),
          ),
        ),
      ),  
    );
  }
  void calculateBMI()
  {
    _bmiresult = _weight/pow(_height/100, 2);
  }
}