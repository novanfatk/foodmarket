part of 'pages.dart';

class SuccessOrderPgaes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IllustrationPage(
          title: 'You ve Made Order',
          subtitle:
              'just stay at home while we are \n preparing your best foods',
          picturePath: 'assets/images/bike.png',
          buttonTap1: () {
            Get.offAll(MainPage());
          },
          buttonTitle1: 'Order Other Foods',
          buttonTap2: () {
            Get.offAll(MainPage(
              initialPage: 1,
            ));
          },
          buttonTitle2: 'View My Order',
        ));
  }
}
