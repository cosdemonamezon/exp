import 'package:flutter/material.dart';

const kBackgroundColor = Color.fromARGB(255, 102, 27, 27);
const kButtonColor = Color.fromARGB(255, 255, 255, 255);
const b = Color.fromARGB(0, 255, 0, 255);

const List<String> banners = [
  "assets/images/banner1.png",
  "assets/images/banner2.png",
  "assets/images/banner3.png",
  "assets/images/banner4.png",
];


const List<Map<String, dynamic>> notifications = [
  {
    'id': 1,
    'no': 'P1000131',
    'title': 'สั่งซื้อสินค้าสำเร็จ',
    'image':'assets/images/banner1.png',
    'description': 'คำสั่งซื้อ P1000131 สำเร็จแล้ว',
    'date': '5 ม.ค. 65'
  },
  {
    'id': 2,
    'no': 'P1000133',
    'title': 'สั่งซื้อสินค้าสำเร็จ',
    'image':'assets/images/banner2.png',
    'description': 'คำสั่งซื้อ P1000133 สำเร็จแล้ว',
    'date': '5 ม.ค. 65'
  },
  {
    'id': 3,
    'no': 'P1000133',
    'title': 'สั่งซื้อสินค้าสำเร็จ',
    'image':'assets/images/banner3.png',
    'description': 'คำสั่งซื้อ P1000133 สำเร็จแล้ว',
    'date': '5 ม.ค. 65'
  },
  {
    'id': 4,
    'no': 'P1000134',
    'title': 'สั่งซื้อสินค้าสำเร็จ',
    'image':'assets/images/banner4.png',
    'description': 'คำสั่งซื้อ P1000134 สำเร็จแล้ว',
    'date': '5 ม.ค. 65'
  },
  
];