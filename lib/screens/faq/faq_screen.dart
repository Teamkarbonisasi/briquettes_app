import 'package:bricket_app/screens/faq/faq_appbar.dart';
import 'package:bricket_app/widgets/accordion/accordion_custom.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({super.key});

  final List<Map<String, String>> _list = [
    {
      "title": "Bagaimana cara mendaftar akun?",
      "text":
          "Klik Daftar, lalu harap mengisi nama depan, nama belakang, email, password, dan nomor hp. jika berhasil, bisa langsung login."
    },
    {
      "title": "Bagaimana cara menggunakan monitoring asap dan suhu?",
      "text":
          "Pastikan kondisi alat dalam keadaan menyala, cek di pojok kanan atas. Jika berwarna hijau alat menyala dan berwarna merah alat mati. Lalu, jika alat menyala nilai pada monitoring berubah secara real time dan tekan 'Mulai Pembakaran'. dan tekan 'Stop Pembakaran' jika proses sudah selesai."
    },
    {
      "title": "Bagaimana cara reset password?",
      "text":
          "Klik Forgot Password, lalu masukkan email yang terdaftar. Cek email untuk membuka link mengganti password baru.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 80),
        child: FaqAppbar(),
      ),
      body: ListView(
        children: _list.map((item) {
          return AccordionCustom(
            title: item["title"]!,
            text: item["text"]!,
          );
        }).toList(),
      ),
    );
  }
}
