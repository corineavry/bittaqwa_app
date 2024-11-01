import 'package:bittaqwa_app/presentation/screen/doa_list.dart';
import 'package:bittaqwa_app/presentation/widgets/Carddoa.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "Doa-Doa",
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
      body: Column(
        children: [
          Image.asset(
            "assets/images/bg_header_dashboard_morning.png",
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.count(
                mainAxisSpacing: 24,
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                children: [
                  CardDoa(
                    imageUrl: "assets/images/ic_menu_doa.png",
                    title: "Pagimalam",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoaListScreen(category: "Pagi & Malam"),
                          ));
                    },
                  ),
                  CardDoa(
                    imageUrl: "assets/images/ic_doa_rumah.png",
                    title: "Rumah",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoaListScreen(category: "Rumah"),
                          ));
                    },
                  ),
                  CardDoa(
                      imageUrl: "assets/images/ic_doa_makanan_minuman.png",
                      title: "Makan",
                      onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoaListScreen(category: "Makanan & Minuman"),
                          ));
                    },),
                  CardDoa(
                      imageUrl: "assets/images/ic_doa_perjalanan.png",
                      title: "Perjalanan",
                      onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoaListScreen(category: "Perjalanan"),
                          ));
                    },),
                  CardDoa(
                      imageUrl: "assets/images/ic_doa_sholat.png",
                      title: "Sholat",
                      onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoaListScreen(category: "Sholat"),
                          ));
                    },),
                  CardDoa(
                      imageUrl: "assets/images/ic_doa_etika_baik.png",
                      title: "Etika Baik",
                      onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoaListScreen(category: "Etika Baik"),
                          ));
                    },),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
