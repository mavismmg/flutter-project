import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'profile_viewmodel.dart';

import '../../widgets/app_bottom_navigation_bar.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Campo para foto
            CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage(''),
              child: Icon(Icons.person, size: 48, color: Colors.white70),
            ),
            const SizedBox(height: 24),
            // Informações pessoais
            Text(
              'Nome do Usuário',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'email@exemplo.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Data de nascimento'),
              subtitle: Text('01/01/2000'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) viewModel.navigateToHome();
          // Adicione navegação para outras abas se necessário
        },
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
