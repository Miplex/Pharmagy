import 'package:get_it/get_it.dart';
import 'package:pharmagy/data/services/appointmentData_Service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppointmentDataService());
}
