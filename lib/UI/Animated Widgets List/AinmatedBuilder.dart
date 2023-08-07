import 'package:animation_app/Model/Provider/Provider_data.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class Ainmated_Builder extends StatefulWidget{
  State<StatefulWidget> createState()=>Ainmated_Builder_s();
}
class Ainmated_Builder_s extends State<Ainmated_Builder> with TickerProviderStateMixin{


  late final AnimationController _controller =AnimationController(
      duration: Duration(seconds: 6),
      vsync: this)..repeat();

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<ProviderData>(context).Anime_List[Provider.of<ProviderData>(context).index]),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: double.infinity,
          //color: Colors.cyan,
          child: AnimatedBuilder(
            animation: _controller,
            child:const FlutterLogo(size: 50,),
            builder: (BuildContext context,Widget? child){
              return Transform.rotate(
                  angle: _controller.value*2*pi,
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}