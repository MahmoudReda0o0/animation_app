import 'package:animation_app/Model/Provider/Provider_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderSetting extends StatefulWidget{
  State<StatefulWidget> createState()=>SliderSetting_s();
}

class SliderSetting_s extends State<SliderSetting>{
  List<String> SliderName=['Slider','Rotate','Scale','Fade','Size by Align'];
  String dropDownValue='';
  var popMenuValue;
  var _controllerBegin =TextEditingController();
  var _controllerEnd   =TextEditingController();
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Setting',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: (popMenuValue==null)? Text('select Slide Transition') :Text(SliderName[popMenuValue]),
            subtitle: Center(
              child: Text('${popMenuValue}'),
            ),
            trailing: PopupMenuButton(
                onSelected: (value){
                  setState(()=>popMenuValue=value);
                  print('${popMenuValue}');
                  Provider.of<ProviderData>(context,listen: false).SliderSelecte=popMenuValue+1;
                },
                itemBuilder: (context){
                  return List<PopupMenuItem>.generate(SliderName.length, (index){
                    return PopupMenuItem(child: Text(SliderName[index]),value: index,);
                  });
                }
            ),
          ),
          SizedBox(height: 50,),
          Wrap(
            spacing: 100,
            direction: Axis.horizontal,
            children: [
              Container(
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Center(child: Text('Tween Begin'),),
                    Container(
                      height: 100,
                      width: 50,
                      child: TextField(
                        controller: _controllerBegin,
                        keyboardType: TextInputType.number,
                        onSubmitted: (String value){
                          print(value);
                        },
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Center(child: Text('Tween End'),),
                    Container(
                      height: 100,
                      width: 50,
                      child: TextField(
                        controller: _controllerEnd,
                        keyboardType: TextInputType.number,
                        onSubmitted: (String value){
                          print(value);
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: (){
                setState((){
                  Provider.of<ProviderData>(context,listen: false).tweenBegin=double.parse(_controllerBegin.text);
                  Provider.of<ProviderData>(context,listen: false).tweenEnd=double.parse(_controllerEnd.text);
                });
                    },
              child: Text('Sumit Tween'))

        ],
      )
    );
  }

  @override
  void dispose(){
    super.dispose();
    _controllerBegin.dispose();
    _controllerEnd.dispose();
  }
}

// ListView.builder(
// itemCount: 5,
// itemBuilder: (context,index){
// return Column(
// children: [
//
// // DropdownButton(
// //   value: dropDownValue,
// //     items:SliderName.map((e) {
// //       return DropdownMenuItem(
// //         value: e,
// //           child: Text('item'));
// //     }).toList(),
// //     onChanged: (String? selectItem)
// // {
// //   setState(()=>dropDownValue=selectItem!);
// // }),
// GestureDetector(
// onTap: (){
// setState((){
// Provider.of<ProviderData>(context,listen: false).SliderSelecte=index+1;
// });
// },
// child: ListTile(
// title: Text(SliderName[index]),
// ),
// ),
// ],
// );
// }),