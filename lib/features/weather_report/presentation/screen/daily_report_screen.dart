import 'package:flutter/material.dart';
import 'package:weather_app/core/extension/app_theme_extension.dart';
import 'package:weather_app/core/widgets/app_background/app_background_widget.dart';
import 'package:weather_app/features/weather_report/data/model/daily_humidity_model.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

class DailyReportScreen extends StatefulWidget {
   
  final List<DailyHumidityModel> dailyHumidityModel;
  

   const DailyReportScreen({super.key, this.dailyHumidityModel =  const[] });

  @override
  State<DailyReportScreen> createState() => _DailyReportScreenState();
}

class _DailyReportScreenState extends State<DailyReportScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
           backgroundColor: Colors.transparent,
           iconTheme: IconThemeData(color: context.theme.primaryText),
          title: Text("Daily Report", style: context.textStyle.bodyLarge!.copyWith(
                color: context.theme.primaryText,
              ),),), 
          body: ListView.builder(
           
            padding: EdgeInsets.all(16),
           
            scrollDirection: Axis.horizontal,
            
            itemCount: widget.dailyHumidityModel.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: AlignmentGeometry.topCenter,
                  child: GlassCard(
                    padding: EdgeInsets.all(8),
                    widget: Container(
                      
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.transparent,),
                      child: Column(
                      
                        mainAxisSize: MainAxisSize.min,
                      
                      
                        children: [
                         Text(widget.dailyHumidityModel[index].humidity.toString(), style: context.textStyle.displayMedium!.copyWith(
                color: context.theme.primaryText,
              ),),
                        ],
                      )),
                  ),
                ),
              );
            }, )),
    );
  }
}