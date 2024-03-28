import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api_bloc/cubits/weather_cubit.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({
    super.key,
  });

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  final _cityTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      backgroundColor: Colors.grey.withAlpha(64),
      onClosing: () {},
      builder: (context) => SizedBox(
        height: 200,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _cityTextFieldController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Search for a City',
                  labelText: 'City',
                ),
                onChanged: (value) {
                  _cityTextFieldController.text = value;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_cityTextFieldController.text != '') {
                  BlocProvider.of<WeatherCubit>(context).getForecast(
                    cityName: _cityTextFieldController.text.trim(),
                  );
                  BlocProvider.of<WeatherCubit>(context).cityName =
                      _cityTextFieldController.text.trim();
                }

                _cityTextFieldController.clear();
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: const Text("Search"),
            ),
          ],
        ),
      ),
    );
  }
}
