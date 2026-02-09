import 'package:pinterest_clone/app.dart';
import 'main_index.dart';

void main() {
  AppLogger.info('App Started');
  runApp(const ProviderScope(child: App()));
}
