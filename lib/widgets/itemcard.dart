import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int itemId;
  final String itemName;
  final int itemAmount;
  final String itemPrice;
  ItemCard({
    required this.itemId,
    required this.itemName,
    required this.itemAmount,
    required this.itemPrice,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              10.0,
              10.0,
            ),
            blurRadius: 5.0,
            spreadRadius: -3.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
             //     alignment: Alignment.center,
                  child: Text('${itemName}',
                    style: const TextStyle(
                        fontSize: 20, color: Colors.black,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Align(
         //        alignment: Alignment.center,
                  child: Text('اسم الصنف',
                    style: const TextStyle(
                      fontSize: 20, color: Colors.black,
                          fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                itemId.toString() + "  "+'كــــود ',
                style: const TextStyle(
                    fontSize: 20, color: Colors.black,
                  //  fontWeight: FontWeight.w700
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                itemAmount.toString() + "  "+'الكمية ',
                style: const TextStyle(
                    fontSize: 20, color: Colors.black,
               //     fontWeight: FontWeight.w700
                ),

              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                itemPrice + "  "+'السعر ',
                style: const TextStyle(
                  fontSize: 20, color: Colors.black,
                  //    fontWeight: FontWeight.w700
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
