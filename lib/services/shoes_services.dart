part of 'services.dart';

class ShoesServices {
  static Future<ApiReturnValue<List<Shoes>>> getShoes() async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockShoes);
  }
}
