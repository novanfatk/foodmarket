part of 'models.dart';

enum TransactionStatus { delivered, on_delivery, pending, cancelled }

class Transaction extends Equatable {
  final int id;
  final Shoes shoes;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;
  final User user;

  Transaction({
    this.id,
    this.shoes,
    this.quantity,
    this.total,
    this.dateTime,
    this.status,
    this.user,
  });

  Transaction copyWith(
      {int id,
      Shoes shoes,
      int quantity,
      int total,
      DateTime dateTime,
      TransactionStatus status,
      User user}) {
    return Transaction(
      id: id ?? this.id,
      shoes: shoes ?? this.shoes,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [id, shoes, quantity, total, dateTime, status, user];
}

List<Transaction> mockTransaction = [
  Transaction(
      id: 1,
      shoes: mockShoes[1],
      quantity: 10,
      total: (mockShoes[1].price * 10 * 1.1).round() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.on_delivery,
      user: mockUser),
  Transaction(
      id: 2,
      shoes: mockShoes[2],
      quantity: 7,
      total: (mockShoes[2].price * 7 * 1.1).round() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.delivered,
      user: mockUser),
  Transaction(
      id: 3,
      shoes: mockShoes[3],
      quantity: 5,
      total: (mockShoes[3].price * 5 * 1.1).round() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.cancelled,
      user: mockUser)
];
