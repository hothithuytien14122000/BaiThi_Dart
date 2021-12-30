// ignore: file_names
// ignore_for_file: unused_import, file_names, duplicate_ignore, unused_element, prefer_const_constructors, unnecessary_new
import 'dart:convert' show utf8;
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ratemyfood/Pages/Model.dart';
import 'package:ratemyfood/Pages/Network.dart';
import 'package:cool_alert/cool_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<childrenDB> childrenData = List();
  var childimg = [
    'img/user.png',
    'img/user1.png',
    'img/user2.png',
    'img/user3.png',
    'img/user1.png',
    'img/user2.png',
    'img/user2.png',
    'img/user1.png',
    'img/user3.png',
    'img/user.png'
  ];

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchProducts().then(
      (dataFromServer) {
        setState(() {
          childrenData = dataFromServer;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Danh Sách Học Sinh',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.black)),
          ],
        ),
        body: Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: childrenData.length,
                    itemBuilder: (context, index) {
                      return new Card(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return new AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Card(
                                            child: Image.asset(
                                              '${childimg[index]}',
                                              height: 50,
                                            ),
                                          ),
                                          Text(
                                            'Họ và Tên: ${childrenData[index].name}',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            'Lớp :${childrenData[index].clas}',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                              ),
                                              text:
                                                  'Tên bố :${childrenData[index].dadname}',
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                              ),
                                              text:
                                                  'Tên mẹ :${childrenData[index].momname}',
                                            ),
                                          ),
                                          Text(
                                            'Địa chỉ :${childrenData[index].address}',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          Text(
                                            'Số điện thoại :${childrenData[index].phonenumber}',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          Text(
                                            'Giới tính :${childrenData[index].sex}',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              CoolAlert.show(
                                                context: context,
                                                type: CoolAlertType.success,
                                                text: "Cập nhật thành công!",
                                              );
                                            },
                                            child: Text("Cập nhật"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    '${childimg[index]}',
                                    height: 50,
                                  ),
                                  Text(
                                    '${childrenData[index].id}. ${childrenData[index].name}',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
