import 'package:flutter/material.dart';

class DOBProvider extends ChangeNotifier {
  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  void setSelectedDate(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }
}

class AgeProvider extends ChangeNotifier {
  int? _currAge;
  int? get currAge => _currAge;
  DateTime currDate = DateTime.now();
  void setAge(DateTime dob) {
    _currAge = (currDate.year -
            dob.year -
            ((currDate.month < dob.month || currDate.day < dob.day) ? 1 : 0))
        .toInt();
    notifyListeners();
  }
}
