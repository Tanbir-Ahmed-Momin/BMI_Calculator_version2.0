import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
class genderwidget extends StatefulWidget {
  final Function(int) onChange;
  const genderwidget({ Key? key, required this.onChange }) : super(key: key);

  @override
  State<genderwidget> createState() => _genderwidgetState();
}

class _genderwidgetState extends State<genderwidget> {
  int _gender = 0;

  final ChoiceChip3DStyle selectedstyle = ChoiceChip3DStyle(
              topColor: Colors.green,
              backColor: Colors.blue
            );

  final ChoiceChip3DStyle unselectedstyle = ChoiceChip3DStyle(
              topColor: Colors.white,
              backColor: Colors.grey
            );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
        children: [
          ChoiceChip3D(
            border: Border.all(color:Colors.blueGrey),
            style: _gender == 1 ? selectedstyle : unselectedstyle,
            onSelected: (){
              setState(() {
                _gender = 1 ;
              });
              widget.onChange(_gender);
            }, 
            onUnSelected: (){}, 
            selected: _gender == 1,
            child: Column(
                  children: [
                    Image.asset("image/man.png",width: 50,),
                    const SizedBox(height: 5,),
                     const Text("Man",style:TextStyle(color: Colors.yellow),),
                  ],
            ),
          ),
          ChoiceChip3D(
            border: Border.all(color:Colors.blueGrey),
            style: _gender == 2 ? selectedstyle : unselectedstyle,
            onSelected: (){
              setState(() {
                _gender = 2 ;
              });
              widget.onChange(_gender);
            }, 
            onUnSelected: (){}, 
            selected: _gender == 2,
            child: Column(
                  children: [
                    Image.asset("image/woman.png",width: 50,),
                    const SizedBox(height: 5,),
                     const Text("Woman",style:TextStyle(color: Colors.yellow),),
                  ],
            ),
          )
        ],
      ),
    );
  }
}