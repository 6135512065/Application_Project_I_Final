import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectflutter/models/Transactions.dart';
import 'package:projectflutter/providers/transaction_provider.dart';
import 'package:projectflutter/widgets/custom_btn.dart';
import 'package:provider/provider.dart';
import 'package:projectflutter/screens/secondPage.dart';
import 'secondPage.dart';

import '../main.dart';
import 'home_page.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  // controller
  final nameController = TextEditingController(); // รับค่าชื่อ-นามสกุล เป็น Text
  final emailController = TextEditingController(); // รับอีเมล์ เป็น Text
  final telController = TextEditingController(); // รับหมายเลขโทรศัพท์ เป็น Text
  final addressController = TextEditingController(); // รับที่อยู่ เป็น Text
  final licenseplateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แบบบันทึกข้อมูลการเข้าสู่หมู่บ้าน"), // ชื่อหัวข้อ
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration:
                        new InputDecoration(labelText: "ชื่อ - นามสกุล :"),
                    autofocus: false,
                    controller: nameController,
                    validator: (String str) {
                      if (str.isEmpty) {
                        return "Please Enter Name - Surname"; // ถ้าไม่มีการกรอก้อมูล ระบบจะแจ้งว่า Please Enter Name - Surname
                      }
                      return null;
                    },
                  ),
                  /*TextFormField(
                    decoration: new InputDecoration(labelText: "อีเมล์"),
                    autofocus: false,
                    controller: emailController,
                    validator: (String str) {
                      if (str.isEmpty) {
                        return "Please Enter Email"; // ถ้าไม่มีการกรอก้อมูล ระบบจะแจ้งว่า Please Enter Email
                      }
                      return null;
                    },
                  ),*/
                  TextFormField(
                    decoration:
                        new InputDecoration(labelText: "เบอร์โทรศัพท์ :"),
                    autofocus: false,
                    controller: telController,
                    keyboardType: TextInputType.number,
                    validator: (String str) {
                      if (str.isEmpty) {
                        return "Please Enter Telephone Number"; // ถ้าไม่มีการกรอก้อมูล ระบบจะแจ้งว่า Please Enter Telephone Number
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: new InputDecoration(labelText: "ที่อยู่ :"),
                    autofocus: false,
                    controller: addressController,
                    validator: (String str) {
                      if (str.isEmpty) {
                        return "Please Enter Address"; // ถ้าไม่มีการกรอก้อมูล ระบบจะแจ้งว่า Please Enter Address
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration:
                    new InputDecoration(labelText: "หมายเลขป้ายทะเบียน :"),
                    autofocus: false,
                    controller: licenseplateController,
                    validator: (String str) {
                      if (str.isEmpty) {
                        return "Please Enter Name - Surname"; // ถ้าไม่มีการกรอก้อมูล ระบบจะแจ้งว่า Please Enter Name - Surname
                      }
                      return null;
                    },
                  ),
                  FlatButton(
                    child: CustomBtn(
                      // เป็นส่วนในการสร้างข้อมูลใหม่ หรือ Add ข้อมูลใหม่
                      text: "เพิ่มข้อมูล",
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          // รับค่า name , email , tel และ address จากผู้ใช้
                          var name = nameController.text;
                          var email = emailController.text;
                          var tel = telController.text;
                          var address = addressController.text;
                          var licenseplate = licenseplateController.text;
                          //การเตรียมข้อมูล หรือ การเตรียม Object
                          Transactions statement = Transactions(
                              name: name,
                              email: email,
                              tel: tel,
                              address: address,
                              licenseplate: licenseplate); //object

                          //เรียกใช้ Provider คือการเรียกใช้ Database เพือเก็บข้อมูลในระบบ แบบ Local Database
                          var provider = Provider.of<TransactionProvider>(
                              context,
                              listen: false);
                          provider.addTransaction(statement);
                          // หลังจากกดปุ่ม จะเป็นการเด้งไปยังหน้า HomePage หรือ หน้า home_screen นั่นเอง เพื่อทำการโชว์ข้อมูลที่ผู้ใช้ได้กรอกลงไป
                          var rount = new MaterialPageRoute(
                              builder: (BuildContext contex) =>
                                  new SecondPage());
                          Navigator.of(context).push(rount);
                        }
                      },
                    ),
                  ),

                  /*Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: new RaisedButton(
                      onPressed: () {
                        var rount = new MaterialPageRoute(
                            builder: (BuildContext contex) => new SecondPage()
                        );
                        Navigator.of(context).push(rount);
                      },
                      child: new Text(
                        "Change Page",
                        style: new TextStyle(
                            color: Colors.blue
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ));
  }
}