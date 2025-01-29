import 'package:age_calculator/provider/date_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final dobProvider = Provider.of<DOBProvider>(context, listen: false);
    final ageProvider = Provider.of<AgeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.calculate_outlined,
              size: 35,
              color: Colors.blueAccent,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Age Calculator",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            width: 400,
            height: 300,
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDatePickerMode: DatePickerMode.year,
                    );
                    //context.read<DOBProvider>().setSelectedDate(pickedDate);
                    dobProvider.setSelectedDate(pickedDate);
                  },
                  style: const ButtonStyle(
                    side: WidgetStatePropertyAll(
                        BorderSide(color: Colors.black38)),
                    fixedSize:
                        WidgetStatePropertyAll(Size(double.maxFinite, 40)),
                  ),
                  child: const Text(
                    "Select your Date of Birth",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    dobProvider.selectedDate != null
                        ? ageProvider.setAge(dobProvider.selectedDate!)
                        : ageProvider.setAge(DateTime.now());
                  },
                  style: const ButtonStyle(
                    side: WidgetStatePropertyAll(
                        BorderSide(color: Colors.black38)),
                    fixedSize:
                        WidgetStatePropertyAll(Size(double.maxFinite, 37)),
                  ),
                  child: const Text(
                    "Calculate Age",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 105,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Your DOB:",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Consumer<DOBProvider>(
                            builder: (ctx, value, child) => Text(
                              value.selectedDate == null
                                  ? '0'
                                  : '${value.selectedDate!.day}/${value.selectedDate!.month}/${value.selectedDate!.year}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 105,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Your Age:",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Consumer<AgeProvider>(
                            builder: (ctx, value, child) => Text(
                              value.currAge == null
                                  ? "0 Years"
                                  : "${value.currAge.toString()} Years",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
