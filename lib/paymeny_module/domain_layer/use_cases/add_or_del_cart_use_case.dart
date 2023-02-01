import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/repository/base_payment_repository.dart';
import '../../../core/error/failure.dart';
import '../entities/add_or_del_from_cart.dart';

class AddOrDeleteCarttCartUseCase {
  final BasePaymentRepository basePaymentRepository;
  AddOrDeleteCarttCartUseCase(
    this.basePaymentRepository,
  );

  Future<Either<Failure, AddOrDeleteFromCart>>call({required int productId}) async {
    return await basePaymentRepository.addOrDelteFromCart(productId: productId);
  }
}
