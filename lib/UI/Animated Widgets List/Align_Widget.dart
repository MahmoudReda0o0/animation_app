import 'package:animation_app/Model/Provider/Provider_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Animated_Align extends StatefulWidget{
  State<StatefulWidget> createState()=>Ainmated_Align_s();
   }

class Ainmated_Align_s extends State<Animated_Align>{
  bool _selected = true;
  Alignment _alignment=Alignment.topLeft;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<ProviderData>(context).Anime_List[Provider.of<ProviderData>(context).index]),
      ),
      body: GestureDetector(
        onTap: (){
          setState(()=>_selected=!_selected);
        },
        child: Center(
          child: Container(
            height: 250,
            width: double.infinity,
            color: Colors.lightGreen,
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(20),
            child: AnimatedAlign(
              alignment: _selected? Alignment.topLeft : Alignment.bottomRight,
              duration: Duration(seconds: 2),
              curve: Curves.easeInBack,
              child: FlutterLogo(size: 50,),
            ),
          ),
        ),
      ),
    );
  }
}