import 'package:app_food/common/enums.dart';
import 'package:app_food/features/app/data/repositories/pizza_repository.dart';
import 'package:app_food/features/app/domain/responses/reponse_result.dart';
import 'package:app_food/features/app/domain/responses/response_pizza.dart';
import 'package:either_dart/either.dart';

class ApiPizzaUseCase {
  final PizzaRepository _pizzaRepository;
  ApiPizzaUseCase(this._pizzaRepository);

  Future<Either<ResponseResult, ResponsePizza>> findAllPizza() async {
    try {
      final result = await _pizzaRepository.findAll();
      return Right(result);
    } catch (e) {
      return Left(
        ResponseResult(
          responseStatus: ResponseStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
