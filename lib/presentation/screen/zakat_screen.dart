import 'package:bittaqwa_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

class ZakatScreen extends StatefulWidget {
  ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  // Membuat sebuah controller untuk menambahkan titik titik
  final MoneyMaskedTextController myController = MoneyMaskedTextController(
    thousandSeparator: '.', 
    decimalSeparator: '', 
    precision: 0,
  );

  // variable awal untuk total harta dan zakat
  double totalHarta= 0;

  double zakatdikeluarkan= 0;

  double minimumharta= 85000000;

  //membuat variable untuk menampung format dari variable awal
  String formattedharta = "";

  String formattedzakatdikeluarkan = "";

  // membuat fungtion untuk menghitung zakat
  void Hitungzakat(){
    // ambil inputan dari ontroller dan hilangkan titik
    String cleanValue = myController.text.replaceAll(".", "");
    // parsig dari string ke double 
    double inputValue = double.tryParse(cleanValue) ?? 0;

    // membuat sebuah pengkondisian jika harta kita lebih sama atau belih dari minimum zakat
    if (inputValue >= minimumharta) {
      // jika input value lebih dari minimum harta kita akan ubah value nya 
      setState(() {
        totalHarta = inputValue;
        zakatdikeluarkan = (inputValue * 2.5) /100;
        // kita ubah menjadi format rupiah
        formattedharta = NumberFormat.currency(locale: 'id_ID', symbol: '').format(totalHarta);
        formattedzakatdikeluarkan = NumberFormat.currency(locale: 'id_ID', symbol: '').format(zakatdikeluarkan);
              });
    } else {
      // jika harta kurang dari 85 jt maka munculkan dialog
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text('Peringatan'),
        content: Text("Harta Anda Tidak Mencapai 85jt"),
        actions: [
          IconButton(onPressed: (){
          Navigator.pop(context);}, 
          icon: Icon(Icons.close))
        ],
      ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget CardHarta (){
      return Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorApp.grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("total Harta", 
            style: TextStyle(
              fontFamily: "PoppinsMedium",
              color: ColorApp.primary,
            ),
            ),
            SizedBox(height: 16,),TextFormField(
              keyboardType: TextInputType.number,
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: ColorApp.primary),
                ),
                label: Text("Masukkan Total Harta"),
                labelStyle: TextStyle(color: ColorApp.text),
                prefix: Text("Rp"),
                fillColor: ColorApp.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(double.infinity, 0),
                padding: EdgeInsets.all(16,),
              ),
              onPressed: (){
                Hitungzakat();
              }, child: Text("OK")),
          ],
        ),
      );
    }
    Widget CardResult(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red[300],
            ),
            child: Column(
              children: [
                Text("Total Uang", style: TextStyle(fontFamily: "PoppinsMadium", color: ColorApp.white),),
                SizedBox(height: 32,),
                Text("Rp ${formattedzakatdikeluarkan}", style: TextStyle(fontFamily: "PoppinsMadium", color: ColorApp.white),),
              ],
            ),
          ),
          SizedBox(width: 20,),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.purple[300],
            ),
            child: Column(
              children: [
                Text("Zakat Dikeluarkan", style: TextStyle(fontFamily: "PoppinsMadium", color: ColorApp.white),),
                SizedBox(height: 32,),
                Text("Rp ${formattedzakatdikeluarkan}", style: TextStyle(fontFamily: "PoppinsMadium", color: ColorApp.white),),
              ],
            ),
          ),
        ],
      );
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: Text(
          "Zakat",
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
      body: ListView(
        children: [
          Image.asset("assets/images/bg_header_zakat.png"),
          CardHarta(),
          CardResult(),
        ],
      ),
    );
  }
} 