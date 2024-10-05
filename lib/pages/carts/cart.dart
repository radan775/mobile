import 'package:flutter/material.dart';
import 'package:food_delivery/pages/payment/payment.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: Text('Ringkasan Pesanan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Kartu Produk
            Card(
              color: Colors.green[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/image/sapi01.jpg', // Ganti dengan URL gambar Anda
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pak Yanto',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('majapahit'),
                          SizedBox(height: 8),
                          Text(
                            'Kambing berkualitas',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Rp 4.500.000'),
                        ],
                      ),
                    ),
                    Text(
                      '1 ekor',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Pilih Waktu Pengecekan
            Card(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ambil pesanan pada:'),
                    SizedBox(height: 8),
                    Text(
                      'Waktu pengecekan belum dipilih',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Navigasi untuk memilih waktu pengecekan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text('Pilih waktu pengecekan'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Total Belanja dan Pilih Metode Pembayaran
            Spacer(),
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Belanja',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rp 4.500.000',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.to(() => PaymentPage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Pilih Metode Pembayaran'),
            ),
          ],
        ),
      ),
    );
  }
}
