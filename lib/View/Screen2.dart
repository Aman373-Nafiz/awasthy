import 'package:awasthy/ViewModel/UserViewModel.dart';
import 'package:awasthy/ViewModel/UserViewModel.dart';
import 'package:awasthy/ViewModel/UserViewModel.dart';
import 'package:awasthy/core/constant/constant.dart';
import 'package:awasthy/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awasthy/View/Widget/TextView.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<UserViewModel>(context, listen: false);
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;

    int data = providerData.getCurrCardIndex();
    UserModel user = providerData.Users[data];
    return Consumer<UserViewModel>(
        builder: (context, providerData, UserViewModel) {
      return Scaffold(
          bottomNavigationBar: Padding(
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
          ),
          body: Stack(children: [
            Positioned(
              top: 40,
              left: 20,
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.green),
                  )),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.network(providerData.Users[data].photo,
                  fit: BoxFit.cover),
            ),
            Positioned(
              top: 380,
              left: 0,
              right: 0,
              child: Container(
                height: h - 380,
                padding: const EdgeInsets.only(
                    left: 35, top: 25, right: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[600],
                      ),
                    ),
                    //TextView(Txt: user.name, size: 26,color:Colors.green[600] ,bold:FontWeight.bold, ),
                    const SizedBox(height: 6),

                    TextView(
                      Txt: 'Company: ${user.company}',
                      size: 17,
                      color: Colors.black,
                      bold: FontWeight.bold,
                    ),
                    const SizedBox(height: 22),

                    TextView(
                      Txt: 'Username: ${user.username}',
                      size: 16,
                      color: Colors.grey,
                      bold: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),

                    TextView(
                      Txt: 'Email id: ${user.email}',
                      size: 16,
                      color: Colors.grey,
                      bold: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),

                    TextView(
                      Txt: 'Address: ${user.address}',
                      size: 16,
                      color: Colors.grey,
                      bold: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),

                    TextView(
                      Txt: 'Zip: ${user.zip}',
                      size: 16,
                      color: Colors.grey,
                      bold: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),

                    TextView(
                      Txt: 'State: ${user.state}',
                      size: 16,
                      color: Colors.grey,
                      bold: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),

                    TextView(
                      Txt: 'Country: ${user.country}',
                      size: 16,
                      color: Colors.grey,
                      bold: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),

                    TextView(
                      Txt: 'Phone: ${user.phone}',
                      size: 16,
                      color: Colors.grey,
                      bold: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          ]));
    });
  }
}
