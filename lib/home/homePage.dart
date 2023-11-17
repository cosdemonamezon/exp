import 'package:carousel_slider/carousel_slider.dart';
import 'package:exp/AlertDialogYesNo.dart';
import 'package:exp/constants.dart';
import 'package:exp/home/detailNews.dart';
import 'package:exp/models/news.dart';
import 'package:exp/services/serviceApi.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, this.a});
  final String? a;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News> news = [];

  @override
  void initState() {
    super.initState();
    _getListNews();
  }

  Future<void> _getListNews() async {
    try {
      final _listNews = await ServiceApi.getNews();

      if (_listNews.isNotEmpty) {
        setState(() {
          news = _listNews;
        });
      } else {
        if (!mounted) return;
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialogYes(
                  title: 'แจ้งเตือน',
                  description: 'ไม่พบข้อมูลข่าว',
                  pressYes: () {
                    Navigator.pop(context, true);
                  },
                ));
      }
    } on Exception catch (e) {
      if (!mounted) return;
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialogYes(
                title: 'Error:',
                description: '${e}',
                pressYes: () {
                  Navigator.pop(context, true);
                },
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: banners.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    banners[index],
                    fit: BoxFit.fill,
                  );
                },
                options: CarouselOptions(
                  height: size.height * 0.35,
                  pageSnapping: false,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: true,
                  viewportFraction: 0.8,
                )),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ข่าวสารวันนี้',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('ดูทั้งหมด')
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.25,
              child: ListView.builder(
                primary: false,
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: notifications.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Container(
                        height: size.height * 0.25,
                        width: size.width * 0.40,
                        margin: EdgeInsetsDirectional.only(end: 16, start: index == 0 ? 16 : 0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: Column(
                            children: [Image.asset(notifications[index]['image']), Text(notifications[index]['description'])],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),


            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ข่าวจากเอพีไอ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('ดูทั้งหมด')
              ],
            ),
            news.isNotEmpty
            ?SizedBox(
              height: size.height * 0.30,
              child: ListView.builder(
                primary: false,
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: news.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailNews(id: news[index].id)));
                        },
                        splashColor: Colors.red,
                        child: Container(
                          height: size.height * 0.30,
                          width: size.width * 0.40,
                          margin: EdgeInsetsDirectional.only(end: 16, start: index == 0 ? 16 : 0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Column(
                              children: [Image.network(news[index].image!), Text(news[index].title!)],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            )
            :SizedBox(
              child: Text('ไม่พบข้อมูล'),
            ),

          ],
        ),
      ),
    );
  }
}
