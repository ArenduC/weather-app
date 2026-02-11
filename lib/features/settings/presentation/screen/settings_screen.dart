import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/settings/presentation/cubit/app_settings_cubit.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});



  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  void initState(){

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SafeArea(
      child: Center(
        child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
          builder: (context, state) {
            if(state is AppSettingsLoading){
              return CircularProgressIndicator(color: theme.cardValue,);
            }
           if(state is AppSettingsLoaded){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.appSettingsModel.themeState.name.toString(), style: AppTypography.textTheme.bodyLarge!.copyWith(color: theme.cardValue)),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: theme.glassBody),
                    onPressed: (){

                      context.read<AppSettingsCubit>().toggleTheme();
                    }, child: Text("Theme change", style: AppTypography.textTheme.bodyMedium!.copyWith(color: theme.cardValue)))
                
                ],
              );
           }

           if(state is AppSettingsFailed){
              return Text('Failed to load settings', style: AppTypography.textTheme.bodyLarge!.copyWith(color: theme.cardValue));
           }
           return SizedBox();
          },
        ),
      ),
    );
  }
}
