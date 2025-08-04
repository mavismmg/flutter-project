import 'package:stacked_services/stacked_services.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends BaseViewModel {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('pt', 'BR'),
    );
    if (picked != null) {
      dateController.text =
          "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      notifyListeners();
    }
  }

  // Validação, navegação e lógica de autenticação
  String? errorMessage;

  // Para navegação com Stacked
  final NavigationService _navigationService = GetIt.I<NavigationService>();

  bool validateForm() {
    errorMessage = null;
    if (nameController.text.trim().isEmpty) {
      errorMessage = 'Nome é obrigatório.';
    } else if (dateController.text.trim().isEmpty) {
      errorMessage = 'Data de nascimento é obrigatória.';
    } else if (emailController.text.trim().isEmpty ||
        !emailController.text.contains('@')) {
      errorMessage = 'E-mail válido é obrigatório.';
    } else if (passwordController.text.length < 6) {
      errorMessage = 'A senha deve ter pelo menos 6 caracteres.';
    } else if (passwordController.text != confirmPasswordController.text) {
      errorMessage = 'As senhas não coincidem.';
    }
    notifyListeners();
    return errorMessage == null;
  }

  Future<void> register() async {
    setBusy(true);
    if (!validateForm()) {
      setBusy(false);
      return;
    }
    await Future.delayed(const Duration(seconds: 1));
    setBusy(false);
    _navigationService.clearStackAndShow('/home');
  }
}
