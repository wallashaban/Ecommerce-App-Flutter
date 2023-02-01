
import '../../domain_layer/entities/add_or_del_or_update_address.dart';

class AddOrDeleteOrUpdateAddressModel extends AddOrDeleteOrUpdateAddress {
  const AddOrDeleteOrUpdateAddressModel({
     super.status=false,
     super.message='',
    // super.address,
  });

  factory AddOrDeleteOrUpdateAddressModel.fromJson(Map<String, dynamic> json) {
    return AddOrDeleteOrUpdateAddressModel(
      status: json['status'],
      message: json['message'],
      //address:  GetAddressModel.fromJson(json['data']),
    );
  }
}
