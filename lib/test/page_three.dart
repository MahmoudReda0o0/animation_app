import 'package:flutter/material.dart';




class PageThree extends StatefulWidget {

  State<StatefulWidget> createState() => PageThree_s();
}
class PageThree_s extends State<PageThree>{
  double rotate_value=0;
  double scale_value=0.5;
  double translateH_value=0;
  double translateV_value=0;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Three: Transform.'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Card(
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Center(
                    child: Transform.rotate(
                      //origin: Offset(25,25),
                      angle: rotate_value,          // Radian Angle
                      child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.yellow,
                          child: Align(alignment: Alignment.center,child: Text('TESTT Rotate'),)

                      ),
                    ),
                  ),
                  Slider(
                    min: 0,
                    max: 2*3.14,
                    value: rotate_value,
                    onChanged: (value){
                      setState((){
                        rotate_value=value;
                      });
                    },
                  ),
                  Text('${rotate_value.toInt()}'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              color: Colors.white30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Transform.scale(
                      scale: scale_value,
                      //  scaleX: 3.0,
                      //  scaleY: 1.0,
                      origin: Offset(20,20),
                      //filterQuality: FilterQuality.high,
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                        child: Align(alignment: Alignment.center,child: Text('TEST Scale',style: TextStyle(color: Colors.black,fontSize: scale_value*1.5),)),
                      ),
                    ),
                  ),
                  Slider(
                    min: 0.5,
                      max: 5,
                      value: scale_value,
                      onChanged: (value){
                        setState((){
                          scale_value=value;
                        });
                      }),
                  Text("${scale_value.toInt()}"),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              color: Colors.cyan[100],
              child: Row(
                children: [
                  Expanded(
                    flex:4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Transform.translate(
                              offset: Offset(translateH_value,translateV_value),
                              child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.green,
                                child: Align(alignment: Alignment.center,child: Text('TEST Translate',style: TextStyle(color: Colors.black),)),
                              )),
                        ),
                        Slider(
                          min: -200,
                            max: 200,
                            label: translateH_value.toInt().toString(),
                            value: translateH_value,
                            onChanged:(value){
                              setState((){
                                translateH_value=value;
                              });
                            }
                        ),
                        Text('${translateH_value.toInt()}')
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Transform.rotate(
                      //origin: Offset(25,25),
                      angle: 3.14/2,
                      child: Slider(
                        min: -100,
                        max: 100,
                        value:translateV_value ,
                        onChanged: (value){
                          setState((){
                            translateV_value=value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Transform(
                      transform: Matrix4.rotationZ(rotate_value)..scale(scale_value)..translate(translateH_value,translateV_value),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.yellowAccent,
                        child: Text('Matrix',style: TextStyle(fontSize: scale_value),
                        ),
                      ),
                    ),
                  );
                }
                );
              },
              child: Text('SUMIT'))
        ],
      ),
    );
  }
}