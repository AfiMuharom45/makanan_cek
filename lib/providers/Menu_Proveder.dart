import 'package:makanan/models/makanan.dart';
import 'package:flutter/material.dart';
import 'package:makanan/main.dart';

class MenuProvider with ChangeNotifier {
  List<Makanan> _makanans = [];

  List<Makanan> get makanans => _makanans;

  void generateMakanan(String name) {
    final List<String> menuItems = [
      "Nasi Goreng",
      "Mie Goreng",
      "Ayam Bakar",
      "Sate Ayam",
      "Soto Ayam",
      "Gado-Gado",
      "Nasi Uduk",
      "Rendang",
      "Gudeg",
      "Pempek",
      "Bakso",
      "Sop Buntut",
      "Nasi Padang",
      "Nasi Campur",
      "Ketoprak",
      "Martabak Manis",
      "Martabak Telur",
      "Nasi Kuning",
      "Lontong Sayur",
      "Bubur Ayam",
      "Nasi Liwet",
      "Nasi Timbel",
      "Ikan Bakar",
      "Soto Betawi",
      "Nasi Kebuli",
      "Rawon",
      "Ayam Goreng",
      "Mie Ayam",
      "Nasi Pecel",
      "Bakmi Jawa",
      "Siomay",
      "Bubur Kacang Hijau",
      "Nasi Goreng Kambing",
      "Tahu Gejrot",
      "Kwetiau Goreng",
      "Karedok",
      "Tahu Campur",
      "Gulai Kambing",
      "Ayam Penyet",
      "Pecel Lele",
      "Es Teler",
      "Es Campur",
      "Es Doger",
      "Cendol",
      "Es Buah",
      "Kolak Pisang",
      "Rujak Buah",
      "Es Kelapa Muda",
      "Es Kopyor",
      "Wedang Jahe",
      "Sekoteng",
      "Bajigur",
      "Bandrek",
      "Susu Jahe",
      "Sarabba",
      "Es Pisang Ijo",
      "Bubur Sumsum",
      "Kue Lapis",
      "Onde-Onde",
      "Klepon",
      "Lemper",
      "Risoles",
      "Pastel",
      "Dadar Gulung",
      "Kue Cubit",
      "Kue Lumpur",
      "Serabi",
      "Kue Pukis",
      "Combro",
      "Misro",
      "Nagasa",
      "Ote-Ote",
      "Bakwan",
      "Cireng",
      "Cilok",
      "Cimol",
      "Tahu Bulat",
      "Keripik Singkong",
      "Keripik Pisang",
      "Keripik Tempe",
      "Rengginang",
      "Peyek Kacang",
      "Emping",
      "Kerupuk Udang",
      "Kerupuk Ikan",
      "Kerupuk Kulit",
      "Rempeyek",
      "Kerupuk Bawang",
      "Kerupuk Rambak",
      "Krupuk Warung",
      "Kerupuk Puli",
      "Krupuk Nasi",
      "Krupuk Melarat",
      "Kerupuk Seblak",
      "Kerupuk Keripik",
      "Kerupuk Banjur",
      "Kerupuk Ceker",
      "Kerupuk Sayur",
      "Kerupuk Lobster",
      "Kerupuk Tahu",
      "Kerupuk Acak",
      "Kerupuk Kedelai",
      "Kerupuk Bawang",
      "Kerupuk Bakar",
      "Kerupuk Terasi",
      "Kerupuk Bayam",
      "Kerupuk Kentang",
      "Kerupuk Udang"
    ];
    _makanans = [
      Makanan(menuItems[DateTime.now().millisecondsSinceEpoch % menuItems.length])
    ];
    notifyListeners();
  }
}
