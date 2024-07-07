import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  // Dummy data notifikasi
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Produk Telah Diproses',
      'description': 'Pesanan Anda sedang diproses. Harap tunggu informasi lebih lanjut.',
      'date': '22 Juni 2024',
      'icon': Icons.shopping_bag,
    },
    {
      'title': 'Pembayaran Berhasil',
      'description': 'Pembayaran bulan Juni 2024 telah berhasil.',
      'date': '22 Juni 2024',
      'icon': Icons.check_circle_outline,
    },
    // Tambahkan data notifikasi lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notifications',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(
                notifications[index]['icon'],
                color: _getIconColor(notifications[index]['icon']),
              ),
              title: Text(notifications[index]['title']),
              subtitle: Text(notifications[index]['description']),
              trailing: Text(notifications[index]['date']),
              onTap: () {
                // Aksi jika notifikasi diklik (opsional)
                _showNotificationDetails(context, notifications[index]);
              },
            );
          },
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan detail notifikasi (opsional)
  void _showNotificationDetails(BuildContext context, Map<String, dynamic> notification) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(notification['title']),
          content: Text(notification['description']),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk memberi warna ikon berdasarkan jenis notifikasi (opsional)
  Color _getIconColor(IconData icon) {
    if (icon == Icons.check_circle_outline) {
      return Colors.green;
    } else if (icon == Icons.shopping_bag) {
      return Colors.blue;
    } else {
      return Colors.blue;
    }
  }
}