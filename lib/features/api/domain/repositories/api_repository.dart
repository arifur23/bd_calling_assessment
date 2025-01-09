import 'package:bd_calling_assessment/datasources/remote/data/api_client.dart';
import 'package:bd_calling_assessment/features/api/domain/repositories/api_repository_interface.dart';
import 'package:bd_calling_assessment/util/app_constants.dart';

class ApiRepository implements ApiRepositoryInterface{

  final ApiClient apiClient;

  ApiRepository({required this.apiClient});



  @override
  Future deleteRecipeData() {
    // TODO: implement deleteRecipeData
    throw UnimplementedError();
  }

  @override
  Future getRecipeData() async{
    print('calling Api Repository');
    return await apiClient.getData(AppConstants.apiUrl);
  }
}