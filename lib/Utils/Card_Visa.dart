import 'package:flutter/material.dart';

class Card_Visa extends StatelessWidget {
  final double balance;
  final int cardNumber;
  final int expiryMo;
  final int expiryYe;
  final Color color;
  final String type;
  final double top;
  const Card_Visa(
      {super.key,
      required this.balance,
      required this.cardNumber,
      required this.color,
      required this.expiryMo,
      required this.expiryYe,
      required this.type,
      required this.top});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            // Visa Logo in the top left corner
            Positioned(
              top: top,
              left: 241,
              child: Image.asset(
                "$type",
                width: 80, // Adjust the size as needed
                height: 80, // Adjust the size as needed
              ),
            ),
            // Other card elements
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(height: 10),
                Text('\$' + balance.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("**** **** **** " + cardNumber.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                    Text(expiryMo.toString() + "/" + expiryYe.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
