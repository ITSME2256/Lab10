import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab10/pages/loginpage.dart';
import 'package:lab10/pages/product_page.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ช่องทางการติดต่อ',
          style: TextStyle(color: Colors.amberAccent),
        ),
        leading: Icon(Icons.art_track, color: Colors.amberAccent),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }).catchError((error) {
                print("Sign out error: $error");
              });
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/contact.jpg",
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Contact Us",
              style: TextStyle(color: Colors.amberAccent),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Name : Supakorn Cherdchai",
              style: TextStyle(color: Colors.amberAccent),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Computer Engineering ",
              style: TextStyle(color: Colors.amberAccent),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Kalasin University ",
              style: TextStyle(color: Colors.amberAccent),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Facebook: ESAN ลาบแซ่บ ",
              style: TextStyle(color: Colors.amberAccent),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email: <supakorn.ch@mail.com>",
              style: TextStyle(color: Colors.amberAccent),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Tel: 099-xxx-xxxx ",
              style: TextStyle(color: Colors.amberAccent),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  color: Colors.amberAccent,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.phone,
                  color: Colors.amberAccent,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.facebook,
                  color: Colors.amberAccent,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'เมนูอาหาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'ติดต่อฉัน',
          ),
        ],
        currentIndex: 1,
        onTap: (index) {
          // ทำสิ่งที่คุณต้องการเมื่อเลือก BottomNavigationBar
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactPage()),
            );
          } else if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductPage()),
            );
          }
        },
        backgroundColor: const Color.fromARGB(255, 125, 127, 128),
        selectedItemColor: const Color.fromARGB(255, 216, 170, 4),
      ),
    );
  }
}
