import 'package:dmin/Constants.dart';
import 'package:dmin/Screens/Home/components/urlogohere.dart';

import 'package:dmin/components/cardbtn.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: kappbartxt,
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ksecondColor,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => {Navigator.pushNamed(context, '/add')},
                    child: cardbtn(
                      txt: "Add",
                      icon: Icons.add,
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      //do smthing
                    },
                    child: cardbtn(
                      txt: "Edit",
                      icon: Icons.edit,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => {
                      //do smthing
                    },
                    child: cardbtn(
                      txt: "Analytics",
                      icon: Icons.analytics_rounded,
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false)
                      //do another db thing
                    },
                    child: cardbtn(
                      txt: "Logout",
                      icon: Icons.data_usage_rounded,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              urlogohere()
            ],
          ),
        ),
      ),
    );
  }
}
