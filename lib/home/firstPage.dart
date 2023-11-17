import 'package:exp/home/homePage.dart';
import 'package:exp/news/newsPage.dart';
import 'package:exp/noti/notiPage.dart';
import 'package:exp/product/productPage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Widget curentPage = HomePage();
  int selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  String titlePage = 'หน้าแรก';

  void onItemNavigation(int index){
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        curentPage = HomePage();
        titlePage = 'หน้าแรก';
      }else if(selectedIndex == 1){
        curentPage = ProductPage();
        titlePage = 'หน้าสินค้า';
      }else if(selectedIndex == 2){
        curentPage = NewsPage();
        titlePage = 'หน้าข่าว';
      }else if(selectedIndex == 3){
        curentPage = NotiPage();
        titlePage = 'แจ้งเตือน';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${titlePage}'),
      ),
      extendBody: true,
      body: SafeArea(
        child: PageStorage(bucket: bucket, child: curentPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemNavigation,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
          BottomNavigationBarItem(icon: Icon(Icons.padding), label: 'หน้าสินค้า'),
          BottomNavigationBarItem(icon: Icon(Icons.new_label), label: 'หน้าข่าว'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'แจ้งเตือน'),
        ],
      ),
    );
  }
}