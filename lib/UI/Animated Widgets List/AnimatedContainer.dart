import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/Provider/Provider_data.dart';
class Animated_Contaoner extends StatefulWidget{
  State<StatefulWidget> createState()=>Animated_Container_s();
}

class Animated_Container_s extends State<Animated_Contaoner>{
  bool selected = true;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<ProviderData>(context).Anime_List[Provider.of<ProviderData>(context).index]),
      ),
      body: GestureDetector(
        onTap: (){
          setState(()=>selected=!selected);
        },
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Container(
                height: selected? 150:250,
                width: selected?250:150,
                color: selected? Colors.black38:Colors.cyan,
                child: FlutterLogo(size: 60),
              ),
            ),
            Center(
              child: AnimatedContainer(
                  height: selected? 150 : 250,
                  width: selected?250:150,
                color: selected? Colors.red:Colors.lightGreen,
                duration: Duration(seconds: 1),
                curve: Curves.easeInBack,
                child: FlutterLogo(size: 60,),

              ),
            ),
          ],
        )
      ),
    );
  }
}