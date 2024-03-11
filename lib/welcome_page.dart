import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab10/pages/loginpage.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData.from(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 148, 8, 8))),
    home: WelcomePage(),
  ));
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/welcome.jpg",
              width: 500,
              height: 500,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "ESAN อาหารสุดแซ่บ",
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 238, 214, 2)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "มาช่วยกันเพิ่มและรวบรวมอาหารอีสานหลากหลายเมนูแสนสุดแซ่บกันเลย",
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 248, 192, 7)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(LoginPage());
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellowAccent,
                ),
                child: Text("เริ่มแซ่บได้เลย"))
          ],
        ),
      ),
    );
  }
}
