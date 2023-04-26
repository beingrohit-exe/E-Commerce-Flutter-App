import 'package:bloggios_mart/Constants/global-variables.dart';
import 'package:bloggios_mart/Provider/user-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user.name;
    return Container(
      decoration: BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: EdgeInsets.only(left: 18, right: 16, bottom: 16, top: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: 'Hello, ',
                style: const TextStyle(color: Colors.white, fontSize: 22),
                children: [
                  TextSpan(
                    text: user.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
