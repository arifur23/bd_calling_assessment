import 'package:bd_calling_assessment/features/api/domain/repositories/api_repository_interface.dart';
import 'package:bd_calling_assessment/features/api/domain/services/api_service_interface.dart';

class ApiService implements ApiServiceInterface{

  final ApiRepositoryInterface apiRepositoryInterface;

  ApiService({required this.apiRepositoryInterface});

  @override
  Future<void> deleteRecipeData() async {

  }

  @override
  Future<dynamic> getRecipeData() async{
    print('calling Api Service');
    return await apiRepositoryInterface.getRecipeData();
  }

}