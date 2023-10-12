import 'package:flutter/material.dart';

class ReusAbleRow extends StatelessWidget {
  String title;
  String value;

   ReusAbleRow({super.key,required this.value,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(height: 5,),
          Divider(),

        ],
      ),
    );
  }
}
