import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../register/register_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EAFE),
        elevation: 0,
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'bipo.',
                  style: GoogleFonts.notoSerif(
                    textStyle: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'O seu diário de humor',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 320,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple.withOpacity(0.1),
                      ),
                    ),
                    // Adapte o caminho da imagem conforme necessário
                    Image.asset(
                      'lib/assets/images/welcome_page_bipo.png',
                      width: 500,
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.0,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 32.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                      child: Text(
                        'Vamos começar',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
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
