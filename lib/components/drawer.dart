import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/components/drawer_tile.dart';
import 'package:notes/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
            child: Icon(
              Icons.note,
              size: 40,
            ),
          )),
          DrawerTile(
            leading: Icon(
              Icons.home,
              size: 20,
            ),
            title: Text("Notes",
                style: GoogleFonts.dmSerifText(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          DrawerTile(
            leading: Icon(
              Icons.settings,
              size: 20,
            ),
            title: Text("Settings",
                style: GoogleFonts.dmSerifText(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ));
            },
          )
        ],
      ),
    );
  }
}
