import 'main_index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the utility here
    ResponsiveUtils().init(context);

    return MaterialApp.router(
      title: 'Pinterest',
      routerConfig: AppRouter.router,
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
