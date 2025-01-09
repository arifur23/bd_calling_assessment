import 'package:bd_calling_assessment/datasources/remote/data/api_client.dart';
import 'package:bd_calling_assessment/features/api/domain/repositories/api_repository.dart';
import 'package:bd_calling_assessment/features/api/domain/repositories/api_repository_interface.dart';
import 'package:bd_calling_assessment/features/api/domain/services/api_service.dart';
import 'package:bd_calling_assessment/features/api/domain/services/api_service_interface.dart';
import 'package:get/get.dart';

import '../features/api/controllers/api_controller.dart';

Future<void> init() async {

  // Core

  ApiClient apiClient = ApiClient(appBaseUrl: "");

  Get.lazyPut(()=> ApiClient(appBaseUrl: ''));

  Get.lazyPut(()=> ApiRepository(apiClient :Get.find()));

  ApiRepositoryInterface apiRepositoryInterface = ApiRepository(apiClient: Get.find());

  Get.lazyPut(()=> apiRepositoryInterface);

  ApiServiceInterface apiServiceInterface = ApiService(apiRepositoryInterface: Get.find());

  Get.lazyPut(()=> apiServiceInterface);



  Get.lazyPut(()=> ApiController(apiServiceInterface: apiServiceInterface));

  Get.lazyPut(()=>ApiService(apiRepositoryInterface: Get.find()));

}