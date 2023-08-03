import 'package:bricket_app/widgets/appbar/leading_custom.dart';
import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget {
  GuideScreen({super.key});

  final List<String> _alat = [
    "Drum kedap udara",
    "Tungku api",
    "Sensor Thermocouple type-k & Modul Max6675",
    "Sensor MQ2",
    "LCD",
    "Mikrokontroler ESP32",
    "Power Bank",
    "Breadboard",
    "Cetakan Briket",
    "Blender",
    "Timbangan Digital",
    "Kompor Briket",
  ];

  final List<String> _bahan = [
    "Daun Kering",
    "Tepung Tapioka",
    "Air",
  ];

  final List<String> _langkahKarbonisasi = [
    "Siapkan Drum, Tungku Api, dan 1 paket alat monitoring",
    "Login pada aplikasi My Briquettes untuk panduan bisa dilihat pada laman 'FAQ'",
    "Nyalakan api, ketika proses karbonisasi berlangsung tekan 'Mulai Pembakaran' di Beranda",
    "Tunggu sampai kadar suhu mencapai 140 derajat Celsius yang bisa dilihat secara realtime pada Beranda",
    "Ketika suhu sudah mencapai 140 derajat Celsius, matikan api dan tunggu kadar asap turun mencapai 35%",
    "Jika sudah, Drum bisa dibuka untuk dilakukan penghalusan menjadi bahan karbon.",
  ];

  final List<String> _langkahMembuat = [
    "Haluskan daun yang sudah dikarbonisasi dengan menggunakan blender",
    "Campurkan tepung tapioka dan air dengan perbandingan 1:5 dan dimasak dengan api kecil hingga menjadi lem aci",
    "Setelah mendapat bahan karbon dan lem aci, campurkan kedua bahan tersebut dengan perbandingan 3:4",
    "Kemudian diaduk secara merata sampai tidak lengket di tangan",
    "Lalu, dicetak menggunakan cetakan dan di press",
    "Briket yang sudah dicetak, siap untuk dijemur dengan panas matahari selama 2 hari",
    "Setelah kering, briket siap digunakan untuk memasak dengan kompor briket"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingCustom(),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Text(
            "Alat:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          ..._alat.map((item) {
            final int index = _alat.indexOf(item);
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "${index + 1}. $item",
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
          const SizedBox(height: 24),
          Text(
            "Bahan:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          ..._bahan.map((item) {
            final int index = _bahan.indexOf(item);
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "${index + 1}. $item",
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
          const SizedBox(height: 24),
          Text(
            "Langkah - langkah karbonisasi:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          ..._langkahKarbonisasi.map((item) {
            final int index = _langkahKarbonisasi.indexOf(item);
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "${index + 1}. $item",
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
          const SizedBox(height: 24),
          Text(
            "Langkah - langkah membuat bricket:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          ..._langkahMembuat.map((item) {
            final int index = _langkahMembuat.indexOf(item);
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "${index + 1}. $item",
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
