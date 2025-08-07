import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'profile_viewmodel.dart';

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
              backgroundImage: AssetImage(
                  'assets/images/avatar_placeholder.png'), // Substitua pelo caminho da imagem do usuário
              child: Icon(Icons.person,
                  size: 48, color: Colors.white70), // Ícone de fallback
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
            // Outras informações podem ser adicionadas aqui
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Data de nascimento'),
              subtitle: Text('01/01/2000'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
