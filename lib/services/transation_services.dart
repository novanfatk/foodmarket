part of 'services.dart';

class TransationServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransation() async {
    await Future.delayed(Duration(seconds: 3));

    return ApiReturnValue(value: mockTransaction);
  }

  static Future<ApiReturnValue<Transaction>> submitTransation(
      Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(
        value:
            transaction.copyWith(id: 123, status: TransactionStatus.pending));
  }
}
