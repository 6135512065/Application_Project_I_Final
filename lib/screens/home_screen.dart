import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectflutter/models/Transactions.dart';
import 'package:projectflutter/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();

  // controller
  final nameController = TextEditingController(); // รับค่าชื่อ-นามสกุล เป็น Text
  final emailController = TextEditingController(); // รับอีเมล์ เป็น Text
  final telController = TextEditingController(); // รับหมายเลขโทรศัพท์ เป็น Text
  final addressController = TextEditingController(); // รับที่อยู่ เป็น Text
  final licenseplateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "ข้อมูลการลงทะเบียนเข้าหมู่บ้าน\n              แบบออนไลน์"), // ชื่อหัวข้อ Title
          actions: [
            IconButton(
                icon: Icon(Icons.delete), // จะเป็นส่วนในการลบข้อมูลออกจากระบบ
                onPressed: () {
                  var name;
                  var email;
                  var tel;
                  var address;
                  var licenseplate;
                  //เตรียมข้อมูล
                  Transactions statement = Transactions(
                      name: name,
                      email: email,
                      tel: tel,
                      address: address,
                      licenseplate: licenseplate); //object

                  //เรียก Provider
                  var provider =
                      Provider.of<TransactionProvider>(context, listen: false);
                  provider.deleteTransaction(statement);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) {
                            return HomeScreen();
                          }));
                }),
            IconButton(
                icon: Icon(Icons
                    .exit_to_app), // จะเป็นส่วนในการออกจากระบบ เด้งไปหน้า login ในหน้าแรก
                onPressed: () {
                  FirebaseAuth.instance
                      .signOut(); // เมื่อกดปุ่ม จะเป็นการเอาข้อมูล Firebase ออกจากระบบ
                }),
          ],
        ),
        body: Consumer(
          builder: (context, TransactionProvider provider, Widget child) {
            var count =
                provider.transactions.length; //เป็นการนับจำนวนข้อมูลในระบบ
            if (count <= 0) {
              // ถ้าข้อมูล = 0 แสดงว่าไม่มีข้อมูลอยู่ในระบบ
              return Center(
                child: Text(
                  "ไม่มีข้อมูลผู้ลงทะเบียน", // ระบบจะทำการแสดงคำว่า No Data
                  style: TextStyle(fontSize: 35),
                ),
              );
            } else {
              // และถ้าข้อมูล != 0 แสดงว่ามีข้อมูลอยู่ในระบบ
              return ListView.builder(
                  // เป็นส่วนแสดงผลข้อมูลของ Contact Form
                  itemCount: count,
                  itemBuilder: (context, int index) {
                    Transactions data = provider.transactions[
                        index]; // เรียกใช้ที่จัดเก็บข้อมูล เช่น Name , Email , Tel หรือ Address
                    return Card(
                      elevation: 6,
                      margin: const EdgeInsets.symmetric(
                          // กำหนดขนาดของกรอบข้อมูล
                          vertical: 8,
                          horizontal: 5),
                      child: ListTile(
                        title: Text(
                            "ชื่อ - นามสกุล : ${data.name}\nเบอร์โทรศัพท์ : ${data.tel}\nที่อยู่ : ${data.address}\nหมายเลขป้ายทะเบียน : ${data.licenseplate}\n"),
                        // แสดงผลข้อมูลจาก Contact Form คือ Name , Email , Tel และ Address
                      ),
                    );
                  });
            }
          },
        ));
  }
}