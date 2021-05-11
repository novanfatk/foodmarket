import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesque/models/models.dart';
import 'package:shoesque/services/services.dart';

part 'transation_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    ApiReturnValue<List<Transaction>> result =
        await TransationServices.getTransation();

    if (result.value != null) {
      emit(TransactionLoaded(result.value));
    } else {
      emit(TransactionLoadingFailed(result.message));
    }
  }

  Future<bool> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransationServices.submitTransation(transaction);

    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transaction + [result.value]));
      return true;
    } else {
      return false;
    }
  }
}
