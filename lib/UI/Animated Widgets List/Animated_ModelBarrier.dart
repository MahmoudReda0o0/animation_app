import 'package:flutter/material.dart';

class ModelBarrier extends StatefulWidget{
  State<StatefulWidget> createState()=>ModalBarrier_s();
}


class ModalBarrier_s  extends State<ModelBarrier>with SingleTickerProviderStateMixin{

  bool ispressed=false;
  late Widget _animatedModalBarrier;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState(){
    super.initState();
    ColorTween _colorTween = ColorTween(
      begin: Colors.orangeAccent.withOpacity(0.5),
      end: Colors.blueGrey.withOpacity(0.5),
    );

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5)
    );

    _colorAnimation=_colorTween.animate(_animationController);

    _animatedModalBarrier=AnimatedModalBarrier(
        color: _colorAnimation,
      dismissible: true,
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Modal Barrier'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(15),child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,width: 250,child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                  ),
                  onPressed: (){
                    setState(()=>ispressed=true);
                    _animationController.reset();
                    _animationController.forward();
                    Future.delayed(Duration(seconds: 3),(){
                      setState(()=>ispressed=false);
                    });
                  },
                  child: Text('Press'),
                ),
                if(ispressed) _animatedModalBarrier,
              ],
            ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}