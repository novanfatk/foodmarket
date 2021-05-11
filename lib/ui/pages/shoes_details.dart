part of 'pages.dart';

class ShoesDetail extends StatefulWidget {
  final Function onBackButtononPresses;
  final Transaction transaction;
  ShoesDetail({this.onBackButtononPresses, this.transaction});

  @override
  _ShoesDetailState createState() => _ShoesDetailState();
}

class _ShoesDetailState extends State<ShoesDetail> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
              child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.transaction.shoes.picturePath),
                    fit: BoxFit.cover)),
          )),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            if (widget.onBackButtononPresses != null) {
                              widget.onBackButtononPresses();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black12,
                            ),
                            child: Image.asset(
                                'assets/images/back_arrow_white.png'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 180),
                      padding:
                          EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 134,
                                    child: Text(
                                      widget.transaction.shoes.name,
                                      style: blackFontStyle2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Rating(widget.transaction.shoes.rate),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = max(1, quantity - 1);
                                      });
                                    },
                                    child: Container(
                                        width: 26,
                                        height: 26,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(width: 1),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/btn_min.png')))),
                                  ),
                                  SizedBox(
                                      width: 50,
                                      child: Text(
                                        quantity.toString(),
                                        textAlign: TextAlign.center,
                                        style: blackFontStyle2,
                                      )),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = min(999, quantity + 1);
                                      });
                                    },
                                    child: Container(
                                        width: 26,
                                        height: 26,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(width: 1),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/btn_add.png')))),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                            child: Text(
                              widget.transaction.shoes.description,
                              style: greyFontStyle,
                            ),
                          ),
                          Text(
                            'Ingredients',
                            style: blackFontStyle3,
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 14, 0, 41),
                              child: Text(
                                widget.transaction.shoes.ingredients,
                                style: greyFontStyle,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total Price',
                                      style:
                                          greyFontStyle.copyWith(fontSize: 13)),
                                  Text(
                                      NumberFormat.currency(
                                              locale: 'id-ID',
                                              symbol: 'IDR',
                                              decimalDigits: 0)
                                          .format(quantity *
                                              widget.transaction.shoes.price),
                                      style: blackFontStyle2.copyWith(
                                          fontSize: 18))
                                ],
                              ),
                              SizedBox(
                                width: 163,
                                height: 45,
                                child: RaisedButton(
                                  onPressed: () {
                                    Get.to(PaymentPage(
                                      transaction: widget.transaction.copyWith(
                                          quantity: quantity,
                                          total: quantity *
                                              widget.transaction.shoes.price),
                                    ));
                                  },
                                  color: mainColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text('Order Now',
                                      style: blackFontStyle2.copyWith(
                                          fontWeight: FontWeight.w500)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
