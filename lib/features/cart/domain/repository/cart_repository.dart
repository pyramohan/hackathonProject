import 'package:hackathon_project/core/errors/failures.dart';
import 'package:hackathon_project/features/cart/data/model/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:hackathon_project/features/cart/data/model/submit_product_model.dart';

abstract class CartRepository {
  Future<Either<Failure, ProductModel>> getProducts();
  Future<Either<Failure, String>> submitProducts();
}
