import 'package:flutter/material.dart';
import 'package:madee_kan/Widgets/custom_card_belum_lunas.dart';

class BelumLunasPage extends StatefulWidget {
  const BelumLunasPage({Key? key}) : super(key: key);

  @override
  State<BelumLunasPage> createState() => _BelumLunasPageState();
}

class _BelumLunasPageState extends State<BelumLunasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Belum Lunas',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CustomCardBelumLunas(
                  alamat: "Kampung dadap no 5",
                  nama: "Made reihan",
                  baruBayar: "50.000",
                  jumlahBayar: "100.000",
                  tanggal: "26-12-2019",
                  isLunas: "BELUM LUNAS"),
            ],
          ),
        ],
      ),
    );
  }
}
