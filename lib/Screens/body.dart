import 'package:dmin/components/cardbtn.dart';
import 'package:flutter/material.dart';

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  get ksecondColor => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: ksecondColor,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => {
                  //do smthing
                },
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
                  //do smthing
                },
                child: cardbtn(
                  txt: "Logout",
                  icon: Icons.data_usage_rounded,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
