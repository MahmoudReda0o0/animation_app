import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/Provider/Provider_data.dart';

class Animated_CrossFade extends StatefulWidget{
  State<StatefulWidget> createState()=>CrossFade_s();
}
class CrossFade_s extends State<Animated_CrossFade>{
  bool selected = true;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<ProviderData>(context).Anime_List[Provider.of<ProviderData>(context).index]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              height:500,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: AnimatedCrossFade(
                firstChild: Image(image: AssetImage('assets/image/t2.jpg'),),
                firstCurve: Curves.easeIn,
                secondChild: Image(image: AssetImage('assets/image/t3.jpg'),),
                secondCurve: Curves.easeInOutQuart,
                crossFadeState:selected? CrossFadeState.showFirst:CrossFadeState.showSecond,
                duration: Duration(seconds: 2),
                //alignment: selected? Alignment.topLeft:Alignment.bottomRight,

              ),
            ),
          ),
          TextButton(
          onPressed: (){
            setState(()=>selected=!selected);
          },
              child: Text('Switch',style: TextStyle(fontSize: 30),))
        ],
      ),
    );
  }
}