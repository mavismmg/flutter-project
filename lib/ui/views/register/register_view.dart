import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'register_viewmodel.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EAFE),
        elevation: 0,
        title: Text(
          '',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.purple),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Vamos lá!',
                style: GoogleFonts.notoSerif(
                  textStyle: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Precisamos de algumas informações para criar sua conta',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    color: Colors.purple,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(18),
              child: GridView.count(
                crossAxisCount: 1,
                shrinkWrap: true,
                childAspectRatio: 5,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TextField(
                    controller: viewModel.nameController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24),
                      fillColor: Colors.yellow.withOpacity(0.1),
                      filled: true,
                    ),
                  ),
                  TextField(
                    controller: viewModel.dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Data de nascimento',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Icon(Icons.calendar_today, color: Colors.black),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24),
                      fillColor: Colors.yellow.withOpacity(0.1),
                      filled: true,
                    ),
                    onTap: () => viewModel.selectDate(context),
                  ),
                  TextField(
                    controller: viewModel.emailController,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24),
                      fillColor: Colors.yellow.withOpacity(0.1),
                      filled: true,
                    ),
                  ),
                  TextField(
                    controller: viewModel.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24),
                      fillColor: Colors.yellow.withOpacity(0.1),
                      filled: true,
                    ),
                  ),
                  TextField(
                    controller: viewModel.confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmar senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24),
                      fillColor: Colors.yellow.withOpacity(0.1),
                      filled: true,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Aqui você pode adicionar a lógica de registro e navegação
                      // Exemplo: viewModel.register();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 32.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      textStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    child: Text(
                      'Registrar',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
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

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();
}
