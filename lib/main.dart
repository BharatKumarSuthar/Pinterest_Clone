import 'package:pinterest_clone/app.dart';
import 'package:pinterest_clone/core/services/shared_pref_service.dart';
import 'main_index.dart';

void main() async {
  AppLogger.info('App Started');
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();
  runApp(const ProviderScope(child: App()));
}
