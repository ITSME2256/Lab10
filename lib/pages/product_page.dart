import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab10/controller/firebase_controller.dart';
import 'package:lab10/pages/contact_page.dart';
import 'package:lab10/pages/loginpage.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});
  final FireBaseController fireBaseController = Get.put(FireBaseController());

  @override
  Widget build(BuildContext context) {
    TextEditingController productNameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('เมนูอาหาร', style: TextStyle(color: Colors.amberAccent)),
        leading: Icon(Icons.restaurant_menu, color: Colors.amberAccent),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
              title: "เพิ่มเมนู",
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: productNameController,
                      decoration: InputDecoration(
                          labelText: "ชื่อเมนู", border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          labelText: "รายละเอียด",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                          labelText: "ราคา", border: OutlineInputBorder()),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        fireBaseController.addProduct(
                            productNameController.text,
                            descriptionController.text,
                            double.parse(priceController.text));
                        productNameController.clear();
                        descriptionController.clear();
                        priceController.clear();
                        Get.back();
                      },
                      child: Text("เพิ่ม"))
                ],
              ));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: fireBaseController.GetProductList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List productlist = snapshot.data!.docs;
                      return ListView.builder(
                          itemCount: productlist.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot document = productlist[index];
                            String docID = document.id;
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  "ชื่อเมนู: ${data['productname']} ราคา: ${data['price']} บาท",
                                  style: TextStyle(color: Colors.amberAccent),
                                ),
                                subtitle: Text(
                                  "รายละเอียด: ${data['description']}",
                                  style: TextStyle(color: Colors.amberAccent),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        productNameController.text =
                                            data['productname'];
                                        descriptionController.text =
                                            data['description'];
                                        priceController.text =
                                            data['price'].toString();
                                        Get.defaultDialog(
                                            title: "แก้ไขเมนู",
                                            content: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: TextField(
                                                    controller:
                                                        productNameController,
                                                    decoration: InputDecoration(
                                                        labelText: "ชื่อเมนู",
                                                        border:
                                                            OutlineInputBorder()),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: TextField(
                                                    controller:
                                                        descriptionController,
                                                    decoration: InputDecoration(
                                                        labelText: "รายละเอียด",
                                                        border:
                                                            OutlineInputBorder()),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: TextField(
                                                    controller: priceController,
                                                    decoration: InputDecoration(
                                                        labelText: "ราคา",
                                                        border:
                                                            OutlineInputBorder()),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            fireBaseController.updateProduct(
                                                                docID,
                                                                productNameController
                                                                    .text,
                                                                descriptionController
                                                                    .text,
                                                                double.parse(
                                                                    priceController
                                                                        .text));
                                                            productNameController
                                                                .clear();
                                                            descriptionController
                                                                .clear();
                                                            priceController
                                                                .clear();
                                                            Get.back();
                                                          },
                                                          child: Text("แก้ไข")),
                                                      SizedBox(width: 10),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          fireBaseController
                                                              .deleteProduct(
                                                                  docID);
                                                          Get.back();
                                                        },
                                                        child: Text("ลบ"),
                                                      ),
                                                      SizedBox(width: 10),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: Text("ปิด"),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ));
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Text("No data in firebase");
                    }
                  }))
        ],
      ),
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
        currentIndex: 0,
        onTap: (index) {
          // ทำสิ่งที่คุณต้องการเมื่อเลือก BottomNavigationBar
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductPage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactPage()),
            );
          }
        },
        backgroundColor: const Color.fromARGB(255, 125, 127, 128),
        selectedItemColor: const Color.fromARGB(255, 216, 170, 4),
      ),
    );
  }
}
