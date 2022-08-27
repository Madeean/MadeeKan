import 'package:flutter/material.dart';

class CustomCardHome extends StatefulWidget {
  const CustomCardHome({Key? key}) : super(key: key);

  @override
  State<CustomCardHome> createState() => _CustomCardHomeState();
}

class _CustomCardHomeState extends State<CustomCardHome> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 0.06),
      width: double.infinity,
      height: height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.7),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(
              -1,
              2,
            ),
          )
        ],
      ),
      padding: EdgeInsets.all(width * 0.03),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Made Reihans',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Kampung dadap no5',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'LUNAS',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.03),
            child: Center(
              child: Text(
                'Rp. 100.000',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width * 0.3,
                  height: height * .11,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Detail Transaksi',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width * 0.35,
                  height: height * .11,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Detail Pengguna',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
