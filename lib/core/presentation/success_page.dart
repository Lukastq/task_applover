import 'package:applover/core/presentation/widgets/applover_logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              ApploverLogo(),
              Text("Success", style: GoogleFonts.roboto(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
