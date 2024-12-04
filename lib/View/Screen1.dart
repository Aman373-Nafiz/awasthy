import 'package:awasthy/View/Screen2.dart';
import 'package:awasthy/View/Widget/TextView.dart';
import 'package:awasthy/View/Widget/UserCard.dart';
import 'package:awasthy/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awasthy/ViewModel/UserViewModel.dart';
import 'package:awasthy/model/UserModel.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
  String name(String naam) {
    var output = naam.split(" ");
    return output[0] + " " + output[1];
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<UserViewModel>(context, listen: false);
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;

    print(providerData.Users.length);
    return FutureBuilder(
        future: providerData.FetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (providerData.Users.isEmpty) {
            return const Center(
              child: Text("Currently there is no data"),
            );
          }
          return Scaffold(
            bottomNavigationBar: Consumer<UserViewModel>(
              builder: (context, providerData, child) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(210, 255, 255, 255),
                      borderRadius: BorderRadius.circular(27),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          spreadRadius: 4,
                          offset: Offset(3, 6),
                        ),
                      ],
                    ),
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            providerData.SelectButton4();
                          },
                          icon: Icon(
                            Icons.history,
                            color: providerData.button4
                                ? Colors.green[600]
                                : Colors.grey,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            providerData.SelectButton3();
                          },
                          icon: Icon(
                            Icons.notifications,
                            color: providerData.button3
                                ? Colors.green[600]
                                : Colors.grey,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            providerData.SelectButton2();
                          },
                          icon: Icon(
                            Icons.bookmark,
                            color: providerData.button2
                                ? Colors.green[600]
                                : Colors.grey,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            providerData.SelectButton1();
                          },
                          icon: Icon(
                            Icons.person,
                            color: providerData.button1
                                ? Colors.green[600]
                                : Colors.grey,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            appBar: AppBar(
              title: TextView(
                  Txt: 'Hello Aswathy',
                  color: TextColor,
                  size: 19,
                  bold: FontWeight.bold),
              centerTitle: true,
              leading: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(189, 255, 255, 255),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.green),
                      ))),
            ),
            body: Consumer<UserViewModel>(
              builder: (context, providerData, child) {
                return Padding(
                  padding: EdgeInsets.only(left: 25, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      TextView(
                          Txt: "Explore the",
                          color: TextColor,
                          size: 24,
                          bold: FontWeight.bold),
                      TextView(
                          Txt: "Beautiful Members",
                          color: TextColor,
                          size: 24,
                          bold: FontWeight.bold),
                      SizedBox(
                        height: 14,
                      ),
                      UserCard(providerData: providerData, h: h, w: w),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
