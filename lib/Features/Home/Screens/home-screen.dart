import 'package:bloggios_mart/Constants/global-variables.dart';
import 'package:bloggios_mart/Features/Home/Widgets/address-box.dart';
import 'package:bloggios_mart/Features/Home/Widgets/carousel-image.dart';
import 'package:bloggios_mart/Features/Home/Widgets/top-categories.dart';
import 'package:bloggios_mart/Provider/user-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            //It is used to put inear gradient
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(left: 15),
                    alignment: Alignment.topLeft,
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      elevation: 1,
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: 'Search Bloggis Mart',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide.none),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 1)),
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Icon(
                                Icons.search,
                                color: Colors.deepPurple,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            AddressBox(),
            const SizedBox(
              height: 16,
            ),
            TopCategories(),
            CarouselImage()
          ],
        ));
  }
}
