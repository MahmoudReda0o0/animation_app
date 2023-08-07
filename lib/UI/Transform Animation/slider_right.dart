

import 'package:animation_app/Model/Provider/Provider_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:provider/provider.dart';

class SliderRight extends PageRouteBuilder{
  final page;

  @override
  void initState(){
    super.install();
    //var offAnimation;
  }
  SliderRight(this.page)
      : super(
      pageBuilder : (context , animation_one, animation_two)=>page,
      transitionsBuilder: (context,animation_one,animation_two,child) {
        // var begin = Offset(1,1);
        // var end = Offset(0, 0);    // for SlideTransition Only

        double provider_begin = Provider.of<ProviderData>(context).tweenBegin;
        double provider_end   = Provider.of<ProviderData>(context).tweenEnd;

        var proviter_tween = Tween(begin: provider_begin,end: provider_end);
        var tweenSlider = Tween(begin: Offset(1,1),end:Offset(0,0));
        var tween =Tween(begin:0.0,end: 1.0);
        var curve = CurvedAnimation(parent: animation_one, curve: Curves.easeInBack);

        switch (Provider.of<ProviderData>(context).SliderSelecte){
          case (1):return SlideTransition(position: tweenSlider.animate(curve),child: child,);
          case (2):return RotationTransition(turns: proviter_tween.animate(curve),child: child,);
          case (3):return ScaleTransition(scale: proviter_tween.animate(curve),child: child,);
          case (4):return FadeTransition(opacity: animation_one,child: child,);
          case (5):return Align(alignment: Alignment.center,child: SizeTransition(sizeFactor: animation_one,child: child,),);
          default: return FadeTransition(opacity: animation_one,child: child,);
        }

        //return FadeTransition(opacity: animation_one,child: child,);

        //return Align(alignment: Alignment.center,child: SizeTransition(sizeFactor: animation_one,child: child,),);

        //return RotationTransition(turns: tween.animate(curveAnimation),child: child,);

        //return ScaleTransition(scale: tween.animate(curveAnimation),child: child,);

        //return SlideTransition(position: tween.animate(curveAnimation),child: child,);

        //return RotationTransition(turns: tween2.animate(curveAnimation1),child: ScaleTransition(scale: tween1.animate(curveAnimation2),child: child,),);
      }
  );
}

// class Slider_Right extends PageRouteBuilder{
//   final page;
//   Slider_Right(this.page)
//       : super(
//     pageBuilder: (context,animation_one,animation_two)=>page,
//     transitionsBuilder: (context,animation_one,animation_two,child){
//
//       var tweenSlider = Tween(begin: Offset(0.0,0.0),end:Offset(1.0,0.0));
//       var tween =Tween(begin:0.0,end: 1.0);
//       var curve = CurvedAnimation(parent: animation_one, curve: Curves.easeInBack);
//
//       switch (Provider.of<ProviderData>(context).SliderSelecte){
//         case (1):return SlideTransition(position: tweenSlider.animate(curve));
//         case (2):return RotationTransition(turns: tween.animate(curve),child: child,);
//         default: return FadeTransition(opacity: animation_one,child: child,);
//       }
//
//     }
//   );
// }

