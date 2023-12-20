import 'package:flutter/material.dart';
import 'package:weather_app/utilities/forecast_util.dart';


Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0];
  var temMin = forecastList![index].temp.min.toStringAsFixed(0);
  var icon = forecastList![index].getIconUrl();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            dayOfWeek,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$temMin °C',
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          Image.network(
            icon,
            scale: 1.2,
            color: Colors.white,
          ),
        ],
      ),
    ],
  );
}
