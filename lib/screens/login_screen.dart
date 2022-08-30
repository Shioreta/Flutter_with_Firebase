import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/services/auth_service.dart';
import 'package:flutter_with_firebase/utils/color_utils.dart';
import 'package:flutter_with_firebase/utils/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Container( 
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [ 
            hexStringToColor("35327B"), 
            hexStringToColor("837ED8"),                                 
            ],
            begin: Alignment.topCenter, 
            end: Alignment.bottomCenter)
        ),       
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20.0, MediaQuery.of(context).size.height * 0.2, 20.0, 0),
            child: Column(
              children: [
                logoWidget("assets/images/idoxs_logo.jpg"),
                SizedBox(height: 40.0),
                reusableTextField(
                  "Username", 
                  Icons.person_rounded, 
                  false, 
                  _usernameController),
                SizedBox(height: 20.0),
                reusableTextField(
                  "Password", 
                  Icons.lock_rounded, 
                  true, 
                  _passwordController),
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
                    context.read<AuthenticationService>().signIn(
                      username: _usernameController.text.trim(),
                      password: _passwordController.text.trim()
                    );
                  }, 
                  child: Text('LOGIN', style: TextStyle(color: Colors.black),),        
                ),

                // ElevatedButton(        
                //   style: ElevatedButton.styleFrom(
                //     elevation: 3.0,
                //     primary: Colors.white,
                //     shape:  RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30.0)
                //     ),
                //     minimumSize: Size(200, 50)
                //   ),
                //   onPressed: () { 
                //     context.read<AuthenticationService>().signIn(
                //       username: _usernameController.text.trim(),
                //       password: _passwordController.text.trim()
                //     );
                //   }, 
                //   child: Text('LOGIN'),        
                // ),
              ],
            ),
          ),
        )
      ),
    );
  }

}