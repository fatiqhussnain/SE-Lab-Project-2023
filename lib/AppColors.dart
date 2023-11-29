import 'package:flutter/material.dart';
bool darkMode = false;

Color themeColor(){
  if(darkMode==true){
    return Colors.black;
  }
  return Colors.teal;
}
Color drawerColor(){
  if(darkMode==true){
    return Colors.black;
  }
  return Colors.white;
}
Color textColor(){
  if(darkMode==true){
    return Colors.white;
  }
  return Colors.black;
}
Color dividerColor(){
  if(darkMode==true){
    return Colors.white;
  }
  return Colors.black;
}
Color backgroundColor(){
  if(darkMode==true){
    return Color(0xFF1E1C1C);
  }
  return Colors.white;
}
Color textFieldBorderColor(){
  if(darkMode==true){
    return Colors.white;
  }
  return Colors.black;
}

const Color themeGrey = Color(0xFF3A3838);
const Color thirteenthColor = Color(0xFFDEDEDE);
const Color themeBlue = Color(0xFF0E7EB9);
const Color themeRed = Color(0xFFEC2845);


const Color quaternaryColor = Color(0xFF4E4E4E);
const Color quinaryColor = Color(0xFF5E5E5E);
const Color senaryColor = Color(0xFF6E6E6E);
const Color septenaryColor = Color(0xFF7E7E7E);
const Color octonaryColor = Color(0xFF8E8E8E);
const Color nonaryColor = Color(0xFF9E9E9E);
const Color denaryColor = Color(0xFFAEAEAE);
const Color eleventhColor = Color(0xFFBEBEBE);
const Color duodenaryColor = Color(0xFFCECECE);
const Color fourteenthColor = Color(0xFFEEEEEE);

