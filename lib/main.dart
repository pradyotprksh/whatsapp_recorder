import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sencorder/app/app.dart';
import 'package:sencorder/device/device.dart';
import 'package:sencorder/domain/domain.dart';

/// The entry point of the application
void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await initServices();
    runApp(MyApp());
  } catch (error) {
    Utility.printELog(error.toString());
  }
}

/// Initialize the services before the app starts.
Future<void> initServices() async {
  Get.put(
    LocalUsecases(
      Get.put(
        Repository(
          Get.put(
            DeviceRepository(),
          ),
        ),
      ),
    ),
    permanent: true,
  );
  await Get.putAsync<void>(() => DeviceRepository().init());
}

/// The my app class which will initialize the basic application structure.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var localLang =
        Get.find<LocalUsecases>().getStringValue(DeviceConstants.localLang);

    return GetMaterialApp(
      title: StringConstants.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: Styles.lightTheme,
      darkTheme: Styles.lightTheme,
      fallbackLocale: const Locale(
        DeviceConstants.defaultLang,
      ),
      locale: Locale(
        localLang,
      ),
      translations: TranslationsFile(),
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
      enableLog: true,
    );
  }
}
