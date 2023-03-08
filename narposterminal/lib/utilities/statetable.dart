import 'dart:async';
import 'package:flutter/material.dart';
import 'package:narposterminal/constant/appconstants.dart';


class ColorOfTable{
  
  final StreamController<Color> _controller = StreamController.broadcast();
  Stream<Color>  get stream => _controller.stream;
  Sink get _sink => _controller.sink;

  Color handleEmpty(){
    _sink.add(Colors.grey);
    return Colors.grey;
  }

  Color handleFull(){
    _sink.add(AppConstant().mainColor);
    return AppConstant().mainColor;
  }
}