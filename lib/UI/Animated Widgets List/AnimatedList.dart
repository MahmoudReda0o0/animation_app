import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/Provider/Provider_data.dart';

class Animated_List extends StatefulWidget{
  State<StatefulWidget> createState()=> Animated_List_s();
}

class Animated_List_s extends State<Animated_List>{

  List _item=[];
  final GlobalKey<AnimatedListState> key = GlobalKey();

  void addItemList(){
    _item.insert(0, "Item ${_item.length+1}");
    key.currentState!.insertItem(0,duration: Duration(seconds: 1));
  }

  void removeItemList(int index){
    key.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
          sizeFactor: animation,
        child: Card(
          margin: EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: Text('Deleted',style: TextStyle(fontSize: 25),),
          ),
        ),
      );
    },
    duration: Duration(milliseconds: 500),
    );
    _item.remove(index);
  }


  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: addItemList,
      ),
      appBar: AppBar(
        title: Text(Provider.of<ProviderData>(context).Anime_List[Provider.of<ProviderData>(context).index]),
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: addItemList,
              icon: Icon(Icons.add_circle),
          ),
          Expanded(
              child: AnimatedList(
            key: key,
                initialItemCount: 0,
                padding: EdgeInsets.all(10),
                itemBuilder: (context,index,animation){
              return SizeTransition(
                sizeFactor: animation ,
                key: UniqueKey(),
                child: Card(
                  margin: EdgeInsets.all(10),
                  color: Colors.orangeAccent,
                  child: ListTile(
                    title: Text(_item[index],style: TextStyle(fontSize: 25),),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: ()=>removeItemList(index) ,
                    ),
                  ),
                ),
              );
                },
          ),
          ),
        ],
      ),
    );
  }
}