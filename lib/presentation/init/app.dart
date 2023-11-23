import 'package:flutter/material.dart';
import 'package:work_calendar/core/models/environment.dart';
import 'package:work_calendar/router/app_router.dart';

class App extends StatelessWidget {
  App({super.key}); 

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final env = Environment.of(context);
    return MaterialApp.router(  
      title: env?.appName ?? '',   
      debugShowCheckedModeBanner: env?.env == Environments.dev,   
      routerConfig: _appRouter.config(),         
    );            
  }
}
