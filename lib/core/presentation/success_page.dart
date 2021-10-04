import 'package:applover/authentication/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:applover/core/presentation/widgets/applover_logo.dart';


class SuccessPage extends ConsumerWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final size = MediaQuery.of(context).size;
    final double paddingTop = 0.4 * (size.height - 150 - 68);
    
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          ref.read(authenticationStateProvider.notifier).signOut();
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

