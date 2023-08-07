import 'package:animation_app/UI/AimationList.dart';
import 'package:animation_app/UI/Transform%20Animation/page_one.dart';
import 'package:animation_app/UI/Transform%20Animation/slider_right.dart';
import 'package:flutter/material.dart';

import 'Transform Animation/transform_type.dart';

class SelectAnimation extends StatelessWidget{
  var page ;
  List classes =[AnimationList(),PageOne(),TransformType()];
  List<String> className=['Ainmated Widget','Slider Transform','Transform'];
  //AnimatedList page = AnimatedList();
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Animation Type'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 3,
          itemBuilder: (context,index){
          return Select_Container(context, classes[index], className[index]);
          })
    );
  }

  Widget Select_Container (BuildContext context,final page,String className){
    return Center(
      child: GestureDetector(
        onTap: ()=>Navigator.of(context).push(SliderRight(page)),
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width*0.9,
          color: Colors.blue[600],
          child: Text(className,style: TextStyle(fontSize: 30,color: Colors.black),),
        ),
      ),
    );
  }
}

// Column(
// children: [
// ElevatedButton(
// onPressed: (){
// Navigator.of(context).push(SliderRight(AnimationList()));
// },
// child: Container(
// width: MediaQuery.of(context).size.width*0.9,
// height: 150,
// decoration: BoxDecoration(
// color: Colors.white30,
// borderRadius: BorderRadius.circular(20),
// ),
//
// child:Align(alignment: Alignment.center,child:  Text('Animating Widget',style: TextStyle(fontSize: 40),),)
// ),
// ),
// ElevatedButton(
// onPressed: (){
// Navigator.of(context).push(SliderRight(PageOne()));
// },
// child: Container(
// width: MediaQuery.of(context).size.width*0.9,
// height: 150,
// decoration: BoxDecoration(
// color: Colors.white30,
// borderRadius: BorderRadius.circular(20),
// ),
//
// child: Align(alignment: Alignment.center,child: Text('Transform Animation',style: TextStyle(fontSize: 40),),)
// ),
// ),
// ],
// ),