import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/constants.dart';
import 'package:flutter_with_firebase/screens/screens.dart';
import 'package:flutter_with_firebase/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
          initialData: null)
      ],
      child: MaterialApp(
        title: 'Flutter Login',
        theme: ThemeData(      
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        ),
        home: AuthenticationWrapper(),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => HomeScreen(),
        //   '/login': (context) => LoginScreen(),
        //   '/register': (context) => RegisterScreen()
        // },
      ),
    );
  }
}

// class AuthenticationWrapper extends StatelessWidget{
//   const AuthenticationWrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthenticationService>(context);
//     return StreamBuilder<User?>(
//       stream: authService.user,
//       builder:(_, AsyncSnapshot<User?> snapshot) {

//       }
//   }
// }

class AuthenticationWrapper extends StatelessWidget{
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return HomeScreen();
    }
    return LoginScreen();
  }
}

