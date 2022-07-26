// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

String SPLASH_SCREEN = '/SplashScreen',
    DETAIL_HAZOB = '/DetailHazob',
    HAZOB_FORM = '/HazobForm',
    VIDEO_CONTAINER_SCREEN = '/VideoContainerScreen',
    ALBUM_CONTAINER_SCREEN = '/AlbumContainerScreen',
    MESSAGE_VIEW = 'MessageView';
Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.white;
  }
  return darkOrangeColor;
}
 bool isChecked = false;
Color mainColor = const Color(0xFFFFE5B4);
Color fontMainColor = const Color(0xFF3A5BA0);
Color darkOrangeColor = const Color(0xFFFFA500);
Color darkBlueColor = const Color(0xFF1F4690);
Color warningColor = const Color(0xFFF6C000);
Color dangerColor = const Color(0xFFFF6969);
