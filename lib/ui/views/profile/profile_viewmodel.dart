import 'package:stacked/stacked.dart';
import 'package:stacked_flutter_project/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToHome() {
    _navigationService.navigateTo('/home');
  }
}
