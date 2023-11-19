import 'package:flutter/material.dart';
import 'package:work_calendar/router/app_router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key}); 

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(            
      routerConfig: _appRouter.config(),         
    );            
  }
}
