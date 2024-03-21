import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 288,
          height: double.infinity,
          color: Color(0xFF17203A),
          child: const Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person_outline_outlined,color: Colors.white,),
                ),
                title: Text("Jaydev Ameta", style: TextStyle(color: Colors.white),),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.white38,
                      height: 1,
                    ),
                  ),
                  ListTile(
                    leading: SizedBox( ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
