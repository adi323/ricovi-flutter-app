import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomThumbShape extends SfThumbShape {
  CustomThumbShape();


  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
      required RenderBox? child,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required SfThumb? thumb}) {
    super.paint(context, center,
        parentBox: parentBox,
        child: child,
        themeData: themeData,
        currentValue: currentValue,
        paint: paint,
        enableAnimation: enableAnimation,
        textDirection: textDirection,
        thumb: thumb);
    
    
    context.canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromCenter(center: center,width: 5.0,height: 15.0),Radius.circular(0.5)),
        Paint()
          ..isAntiAlias = true
          ..style = PaintingStyle.fill
          ..color = themeData.activeTrackColor!);
  }
}