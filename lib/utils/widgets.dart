import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 200.0,
    height: 200.0,    
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
  TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color:  Colors.white,),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white, letterSpacing: 1.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
                    Radius.circular(20)
                  ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(20)
          ),
        )
      ),
    ); 
  }

