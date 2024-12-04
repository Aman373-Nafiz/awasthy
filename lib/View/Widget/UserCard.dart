import 'package:awasthy/View/Screen2.dart';
import 'package:awasthy/ViewModel/UserViewModel.dart';
import 'package:awasthy/core/constant/constant.dart';
import 'package:awasthy/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  final providerData;
  final w, h;
  const UserCard({super.key, this.providerData,this.w,this.h});
String name(String naam) {
    var output = naam.split(" ");
    return output[0] + " " + output[1];
  }
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<UserViewModel>(context, listen: false);
    return Expanded(
        child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: providerData.Users.length,
      itemBuilder: (context, index) {
        UserModel user = providerData.Users[index];
        return GestureDetector(
          onTap: () {
            providerData.setCardIndex(index);
            if (providerData.getCurrCardIndex() != -1) {
              print("Index nnot set");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Screen2();
              }));
            }
          },
          child: Card(
              elevation: 12,
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        height: w / 3,
                        width: w / 3.5,
                        child: Image.network(
                          user.photo,
                          fit: BoxFit.fill,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Text(
                      '${name(user.name)}',
                      style: TextStyle(
                          color: TextColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
        );
      },
    ));
  }
}
