import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('pt', 'BR'),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = 
          "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5EAFE),
        elevation: 0,
        title: Text(
          '',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.purple),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Vamos lá!',
                style: GoogleFonts.notoSerif(
                  textStyle: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  color: Colors.black,
                  ),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Precisamos de algumas informações para criar sua conta',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.purple,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.all(18),
              child: GridView.count(
                crossAxisCount: 1,
                shrinkWrap: true,
                childAspectRatio: 5,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      fillColor: Colors.yellow.withOpacity(0.1),
                      filled: true, 
                    ),
                  ),
                  TextField(
                    controller: _dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Data de nascimento',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Icon(Icons.calendar_today, color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      fillColor: Colors.yellow.withOpacity(0.1),
                      filled: true,
                    ),
                    onTap: () => _selectDate(context),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      fillColor: Colors.yellow.withOpacity(0.1),
                      filled: true,
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      fillColor: Colors.yellow.withOpacity(0.1),
                      filled: true,
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmar senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      fillColor: Colors.yellow.withOpacity(0.1),
                      filled: true,
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      textStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    child: Text(
                      'Registrar',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}