import 'package:exp/AlertDialogYesNo.dart';
import 'package:exp/models/news.dart';
import 'package:exp/services/serviceApi.dart';
import 'package:flutter/material.dart';

class DetailNews extends StatefulWidget {
  DetailNews({super.key, required this.id});
  int id;
  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  News? newsDetail;

  String a = '4444';

  String? b;

  @override
  void initState() {
    super.initState();
    getNewsDetail();
  }

  Future<void> getNewsDetail() async{
    try {
      final _newsDetail = await ServiceApi.getNewsById(id: widget.id);
      if (_newsDetail != null) {
        setState(() {
          newsDetail = _newsDetail;
        });
      } else {
         if (!mounted) return;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialogYes(
                title: 'แจ้งเตือน',
                description: 'ไม่พบข่าว',
                pressYes: () {
                  Navigator.pop(context, true);
                },
              ));
      }
    }on Exception catch (e) {
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
      appBar: AppBar(
        title: Text('ข่าว'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: newsDetail != null
        ?Column(
          children: [
            SizedBox(height: size.height * 0.02,),
            Image.network(newsDetail!.image!),
            Text(newsDetail!.detail!),
          ],
        ):SizedBox(),
      ),
    );
  }
}