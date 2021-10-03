import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:applover/core/presentation/widgets/applover_logo.dart';


class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final double paddingTop = 0.4 * (size.height - 150 - 68);
    
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushNamedAndRemoveUntil("login", (e) => false);
          return true;
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: paddingTop),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 150,
                  width: 150,
                  child: Hero(
                    tag: "applover",
                    child: ApploverLogo(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    "Success!",
                    style: GoogleFonts.roboto(fontSize: 28),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

