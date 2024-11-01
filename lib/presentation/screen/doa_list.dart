
import 'package:bittaqwa_app/data/doa_data.dart';
import 'package:bittaqwa_app/presentation/screen/detail_doa.dart';
import 'package:bittaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class DoaListScreen extends StatelessWidget {
  final String category;
  const DoaListScreen({super.key,required this.category,  });

  @override
  Widget build(BuildContext context) {

    final List<Map<String,String>> doalist =getDoaList(category);
    return Scaffold(
      backgroundColor: ColorApp.blue,
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "",
          style: TextStyle(
            fontFamily: "PoppinsMedium",
            color: ColorApp.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ColorApp.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: doalist.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 12, left: 16, right: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorApp.white,
            ),
            child: ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailDoa(
                title: doalist[index]["title"]!,
                arabicText: doalist[index]["arabicText"]!,
                reverence: doalist[index]["reference"]!,
                translation: doalist[index]["translation"]!,
              ),)),
              leading: Image.asset(
                "${doalist[index]["image"]}",
              ),
              title: Text(
                "${doalist[index]["title"]}",
                style: TextStyle(
                  fontFamily: "PoppinsMedium",
                  fontSize: 20,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
