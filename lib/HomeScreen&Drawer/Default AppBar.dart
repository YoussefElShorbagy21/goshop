
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:tasks/HomeScreen&Drawer/ZoomDrawer.dart';

PreferredSizeWidget DefaultAppBar(BuildContext context, String text,double height) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: AppBar(
      backgroundColor: Colors.purple.shade800,
      centerTitle: true,
      title: const Text('text', style:
      TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )
        ,),
      actions: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ZoomDrawers()));
            },
            icon: Icon(Icons.home_outlined,
                size: 25),),
        ),
      ],
      leading: IconButton(onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
        icon: const Icon(Icons.list_sharp),
      ),
    ),
  );
}