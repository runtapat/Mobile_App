import 'package:flutter/material.dart';
import 'food.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      home: const MyHomePage(title: 'เลือกเมนูอาหาร'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<foodMenu> menus = [
    foodMenu("ข้าวกะเพรา", "70", "assets/images/m1.jpg"),
    foodMenu("ผัดไท", "70", "assets/images/m2.jpg"),
    foodMenu("ซูชิ", "15", "assets/images/m3.jpg"),
    foodMenu("บารบีคิว", "15", "assets/images/m4.jpg"),
    foodMenu("ซาลาเปา", "15", "assets/images/m5.jpg"),
    foodMenu("กุ้งเผา", "1500", "assets/images/m6.jpg"),
    foodMenu("ต้มมะระ", "70", "assets/images/m7.jpg"),
    foodMenu("ปลาทอด", "180", "assets/images/m8.jpg"),
    foodMenu("แหนมเนือง", "200", "assets/images/m9.jpg"),
    foodMenu("เบอร์เกอร์", "90", "assets/images/m10.jpg"),
    foodMenu("แกงเขียวหวานไก่", "70", "assets/images/m11.jpg"),
    foodMenu("กระเพาะปลา", "100", "assets/images/m12.jpg"),
    foodMenu("แกงมัสมั่นไก่", "60", "assets/images/m13.jpg"),
    foodMenu("ราเมน", "60", "assets/images/m14.jpg"),
    foodMenu("ไข่เจียว", "60", "assets/images/m15.jpg"),
    foodMenu("ไข่ข้น", "60", "assets/images/m16.jpg"),
    foodMenu("แกงไตปลา", "60", "assets/images/m17.jpg"),
    foodMenu("ข้าวขาหมู", "60", "assets/images/m18.jpg"),
    foodMenu("ข้าวหมูแดง", "60", "assets/images/m19.jpg"),
    foodMenu("ก๋วยเตี๋ยว", "60", "assets/images/m20.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    int countfood = 0;
    int totalprice = 0;
    int price = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (BuildContext context, int index) {
          foodMenu food = menus[index];
          return ListTile(
            leading: Image.asset(food.img),
            title: Text("เมนูที่ ${index + 1}" + ". " + food.foodname),
            subtitle: Text(food.foodname + " ราคา ${food.foodprice} บาท"),
            onTap: () {
              price = int.parse(food.foodprice);
              countfood += 1;
              totalprice += price;

              AlertDialog alert = AlertDialog(
                title: Text(
                  "คุณได้เลือกเมนู: ${food.foodname}\n คุณเลือกไปทั้งหมด: ${countfood} รายการ รวมเป็นราคา ${totalprice} บาท",
                ),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          );
        },
      ),
    );
  }
}
