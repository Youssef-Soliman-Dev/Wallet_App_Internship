import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/BillScreen.dart';
import 'package:flutter_app/Screens/TransactionsScreen.dart';
import 'package:flutter_app/Screens/TransferScreen.dart';
import 'package:flutter_app/Utils/Buttons.dart';
import 'package:flutter_app/Utils/Card_Visa.dart';
import 'package:flutter_app/Utils/Lists.dart';
import 'package:flutter_app/bar/NavBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomesSreen extends StatefulWidget {
  const HomesSreen({super.key});

  @override
  State<HomesSreen> createState() => _HomesSreenState();
}

class _HomesSreenState extends State<HomesSreen> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavBar(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFF3D2D4B),
        animationDuration: Duration(seconds: 1),
        items: [
          IconButton(
            onPressed: () {
              /* Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => HomesSreen()));*/
            },
            icon: Icon(Icons.home, size: 40),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/scanner.png",
              scale: 12,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, size: 40),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned menu icon to open the drawer
            Positioned(
              top: 20,
              left: 10, // Adjust to move the icon away from the top-left corner
              child: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu, size: 40, color: Colors.grey),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Open the drawer
                  },
                ),
              ),
            ),
            // Centered "My Cards" text
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        " Cards",
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Content below the top section
            Positioned(
              top: 80, // Adjust to place content below the "My Cards" text
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // Cards
                  Container(
                    height: 159,
                    width: double
                        .infinity, // Use double.infinity for responsive width
                    child: PageView(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Card_Visa(
                          top: -25,
                          type: "assets/icons/visa.png",
                          balance: 5000.00,
                          cardNumber: 3498,
                          expiryMo: 11,
                          expiryYe: 28,
                          color: Color(0xFF685BE7),
                        ),
                        Card_Visa(
                          top: -18,
                          type: "assets/icons/master.png",
                          balance: 200.00,
                          cardNumber: 9897,
                          expiryMo: 07,
                          expiryYe: 28,
                          color: Color(0xFF191C23),
                        ),
                        Card_Visa(
                          top: -25,
                          type: "assets/icons/visa.png",
                          balance: 580.00,
                          cardNumber: 9876,
                          expiryMo: 09,
                          expiryYe: 28,
                          color: Color(0xFF0091C6),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Color(0xFF3D2D4B),
                      dotColor: Colors.grey,
                    ),
                    axisDirection: Axis.horizontal,
                  ),
                  SizedBox(height: 20),
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Transfer Button
                      Buttons(
                        screen: TransferScreen(),
                        iconImagePath: "assets/icons/send.png",
                        buttonText: "Send",
                      ),
                      // Bills Button
                      Buttons(
                        screen: BillScreen(),
                        iconImagePath: "assets/icons/payment.png",
                        buttonText: "Pay",
                      ),
                      // Transactions Button
                      Buttons(
                        screen: BillScreen(),
                        iconImagePath: "assets/icons/bill.png",
                        buttonText: "Bills",
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  // Stats + Transactions
                  Lists(
                    imageIconPath: "assets/icons/stats.png",
                    subtitle: "Payments and Income",
                    tiletitle: "Statistics",
                    screen: BillScreen(),
                  ),
                  Lists(
                    imageIconPath: "assets/icons/transactions.png",
                    subtitle: "Transactions History",
                    tiletitle: "Transactions",
                    screen: TransactionsScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
