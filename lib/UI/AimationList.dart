import 'package:animation_app/Model/Provider/Provider_data.dart';
import 'package:animation_app/UI/Animated%20Widgets%20List/AinmatedBuilder.dart';
import 'package:animation_app/UI/Animated%20Widgets%20List/Align_Widget.dart';
import 'package:animation_app/UI/Animated%20Widgets%20List/AnimatedCrossFade.dart';
import 'package:animation_app/UI/Animated%20Widgets%20List/AnimatedList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Animated Widgets List/AnimatedContainer.dart';
import 'Animated Widgets List/Animated_ModelBarrier.dart';


class AnimationList extends StatelessWidget{
 // List<String> Anime_List=['Animated Align Widget','Animated Builder Widget','Animated Container Widget','Animated CrossFade Widget','Animated Default TextStyle Widget'];
  Widget build(BuildContext context){
    var page;
    return Consumer<ProviderData>(
      builder: (context,providerData,child){
        return Scaffold(
          appBar: AppBar(
            title: Text('Animation List'),
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: providerData.Anime_List.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    providerData.index=index;
                    switch (providerData.index){
                      case(0):
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Animated_Align()));
                      break;
                      case(1):
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Ainmated_Builder()));
                        break;
                      case(2):
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Animated_Contaoner()));
                        break;
                      case(3):
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Animated_CrossFade()));
                        break;
                      // case(4):
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Animated_IconANDText()));
                      //   break;
                      case(5):
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Animated_List()));
                        break;
                      case(6):
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ModelBarrier()));
                        break;
                      default:
                        print('defualt');
                        break;

                    }
                    },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    //padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title:Text(providerData.Anime_List[index],style: TextStyle(fontSize: 25),),
                    ),
                  ),
                );
              }
          ),
        );
      },
    );
  }
}