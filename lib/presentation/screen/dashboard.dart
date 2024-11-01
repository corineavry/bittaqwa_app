import 'package:bittaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {

Widget Header(){
  return Container(
    height: 250,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/bg_header_dashboard_morning.png"),fit: BoxFit.cover)
    ),
  );
}
   Widget Cardmenus(){
    return Container(
      margin:EdgeInsets.all(16) ,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: ColorApp.primary,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context,'/doa'),
              child: Column(
                children: [
                  Image.asset("assets/images/ic_menu_doa.png"),
                  Text("doa-doa",style: TextStyle(fontFamily: "PoppinsSemiBold",color: ColorApp.white,))
                ],
              ),
            ),
            SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/zakat');
              },
              child: Column(
                children: [
                  Image.asset("assets/images/ic_menu_zakat.png"),
                  Text("Zakat",style: TextStyle(fontFamily: "PoppinsSemiBold",color: ColorApp.white),)
                ],
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              children: [
                Image.asset("assets/images/ic_menu_jadwal_sholat.png"),
                Text("Jadwal Sholat",style: TextStyle(fontFamily: "PoppinsSemiBold",color: ColorApp.white),)
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              children: [
                Image.asset("assets/images/ic_menu_video_kajian.png"),
                Text("Kajian",style: TextStyle(fontFamily: "PoppinsSemiBold",color: ColorApp.white),)
              ],
            ),
          ],
        ),
      ),
    );
   }
    
    Widget Inspiration(){
      return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text("Inpirasi",
              style: TextStyle(
                fontFamily: "PoppinsSemiBold",
                fontSize: 16,
              ),
              ),
            ),
            SizedBox(height: 8,),
                Image.asset("assets/images/img_inspiration.png"),
            SizedBox(height: 8,),
                Image.asset("assets/images/img_inspiration_2.jpeg"),
            SizedBox(height: 8,),
                Image.asset("assets/images/img_inspiration_3.jpeg"),
            SizedBox(height: 8,),
                Image.asset("assets/images/img_inspiration_4.jpeg"),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: ListView(
        children: [
          Header(),
          Cardmenus(),
          Inspiration()
        ],
      ),
    );
  }
}