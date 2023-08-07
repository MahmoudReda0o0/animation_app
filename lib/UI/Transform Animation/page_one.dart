import 'package:animation_app/UI/SelectAnimation.dart';
import 'package:animation_app/UI/Transform%20Animation/page_two.dart';
import 'package:animation_app/UI/Transform%20Animation/transform_type.dart';
import 'package:animation_app/test/page_three.dart';
//import 'package:animation_app/test/page_two.dart';
import 'package:animation_app/UI/Transform%20Animation/slider_right.dart';
import 'package:flutter/material.dart';
import 'package:animation_app/UI/Transform%20Animation/SliderSetting.dart';


class PageOne extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(SliderRight(SliderSetting()));
        },
        child: Icon(Icons.three_g_mobiledata),
      ),
      appBar: AppBar(
        title: Text("PageOne"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){Navigator.of(context).pushReplacement(SliderRight(SelectAnimation()));},
              icon: Icon(Icons.arrow_back_ios))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
            child: TextButton(
              onPressed: ()=>Navigator.pop(context),
              child: Text('Pop Back'),
            ),
          ),
          Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push(SliderRight(PageTwo()));
                },
                child: Text('click to animate to another slide',style: TextStyle(color: Colors.black,fontSize: 30),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}