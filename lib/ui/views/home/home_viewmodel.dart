import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_flutter_project/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  int? selectedMood;
  List<String> reminders = [];
  String lastMoodMessage = '';
  bool showMoodMessage = false;
  String? savedText;
  final _navigationService = locator<NavigationService>();

  void navigateToProfile() {
    _navigationService.navigateTo('/profile-view');
  }

  // Mood selection logic
  void onMoodSelected(int mood) {
    selectedMood = mood;
    //lastMoodMessage = getMoodMessage();
    showMoodMessage = false;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 100), () {
      showMoodMessage = true;
      notifyListeners();
    });
  }

  // Reminder logic
  void addReminder(String reminder) {
    reminders.add(reminder);
    notifyListeners();
  }

  void editReminder(int index, String newReminder) {
    reminders[index] = newReminder;
    notifyListeners();
  }

  void deleteReminder(int index) {
    reminders.removeAt(index);
    notifyListeners();
  }

  // Day feeling input logic
  void saveDayFeeling(String text) {
    savedText = text;
    notifyListeners();
  }

  void cancelDayFeeling() {
    notifyListeners();
  }
}
