import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  int? selectedMood;
  List<String> reminders = [];
  String lastMoodMessage = '';
  bool showMoodMessage = false;
  String? savedText;

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
