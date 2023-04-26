import 'package:bloggios_mart/Features/User%20Account/Widgets/account-button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  _TopButtonsState createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: "My Orders", onTap: () {}),
            AccountButton(text: "Switch Seller", onTap: () {}),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            AccountButton(text: "Sign Out", onTap: () {}),
            AccountButton(text: "My Wishlist", onTap: () {}),
          ],
        ),
      ],
    );
  }
}
