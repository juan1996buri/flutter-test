import 'package:app_food/features/app/domain/responses/response_pizza.dart';

abstract class PizzaRepository {
  Future<ResponsePizza> findAll();
}
