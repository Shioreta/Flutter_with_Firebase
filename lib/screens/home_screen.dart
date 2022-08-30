import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/services/auth_service.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            children: [
              Text("Welcome!"),
              SizedBox(height: 20.0),
              ElevatedButton(                  
                style: ElevatedButton.styleFrom(
                  elevation: 3.0,
                  primary: Colors.white,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  minimumSize: Size(200, 50)
                ),
                onPressed: () { 
                  context.read<AuthenticationService>().signOut();
                }, 
                child: Text('LOGOUT', style: TextStyle(color: Colors.black),),        
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}