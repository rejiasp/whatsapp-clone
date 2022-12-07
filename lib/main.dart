import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Camera_Screen/camera.dart';
import 'package:whatsapp/home_screen/home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras=await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Home',
      theme: ThemeData(
     
        primarySwatch: Colors.teal,
      ),
      home: HomePage()
    );
  }
}

