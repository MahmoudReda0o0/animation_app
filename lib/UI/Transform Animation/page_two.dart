import 'package:animation_app/UI/Transform%20Animation/SliderSetting.dart';
import 'package:animation_app/UI/Transform%20Animation/page_one.dart';
import 'package:animation_app/UI/Transform%20Animation/transform_type.dart';
import 'package:animation_app/test/page_three.dart';
import 'package:animation_app/UI/Transform%20Animation/slider_right.dart';
import 'package:flutter/material.dart';

import '../SelectAnimation.dart';
class PageTwo extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(SliderRight(SliderSetting()));
        },
        child: Icon(Icons.three_g_mobiledata),
      ),
      appBar: AppBar(
        title: Text('Page Two'),
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
            color: Colors.yellow,
            child: TextButton(
              onPressed: ()=>Navigator.pop(context),
              child: Text('Pop Back'),
            ),
          ),
          Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.orangeAccent,
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push(SliderRight(PageOne()));
                },
                child: Text('click to go back ',style: TextStyle(fontSize: 30),),
              ),
            )
          ),
        ],
      ),
    );
  }
}