import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/Themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            "Settings",
            style: GoogleFonts.dmSerifText(
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("DarkMode"),
                    CupertinoSwitch(
                        value:
                            Provider.of<THemeProvider>(context, listen: false)
                                .isDark,
                        onChanged: (value) =>
                            Provider.of<THemeProvider>(context, listen: false)
                                .toogletheme())
                  ],
                ))
          ],
        ));
  }
}
