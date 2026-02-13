import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_report/data/model/weather_data_model.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

class HumidityCard extends StatelessWidget{
  final WeatherDataModel? weatherDataModel;
  const HumidityCard({super.key, this.weatherDataModel});

  @override
  Widget build(BuildContext context){

     final theme = AppTheme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      alignment: Alignment.center,
      
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
       
        children: [
          Expanded(
            child: GlassCard(
            
              widget:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlassCard(
                    borderRadius: 12,
                    
                    widget: Icon(Icons.navigation)),
                  Text("Data"),
                  Row(children: [Text("3.3"), Text("km/h")],),
                  Stack(children: [
                    Container(
                    height: 10,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.location.withOpacity(.2), 
                      borderRadius: BorderRadius.circular(5)),),

                      Container(
                    height: 10,
                    width: 50,
                    decoration: BoxDecoration(
                      color: theme.location, 
                      borderRadius: BorderRadius.circular(5)),),
                      
                      ],)
                  
                ],
              ),
             
                 
            ),
          ),
          SizedBox(width: 16,),
          Expanded(
            child: GlassCard(
                
              widget:  Text("Data"),
             
                 
            ),
          ),
        ],
      ),
    );
  
  }
}