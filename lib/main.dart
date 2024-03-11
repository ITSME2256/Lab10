import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab10/firebase_options.dart';
import 'package:lab10/pages/loginpage.dart';
import 'package:lab10/pages/product_page.dart';
import 'package:lab10/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TextEditingController productNameController=TextEditingController();
    // TextEditingController descriptionController=TextEditingController();
    // TextEditingController priceController=TextEditingController();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ESAN ',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 243, 64, 9)),
          useMaterial3: true,
        ),
        home: WelcomePage());
  }
}
