part of 'widgets.dart';

class ShoesList extends StatelessWidget {
  final Shoes shoes;
  final double itemWidth;

  ShoesList({@required this.shoes, @required this.itemWidth});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(shoes.picturePath), fit: BoxFit.cover)),
        ),
        SizedBox(
            width: itemWidth - 182,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoes.name,
                  style: blackFontStyle2,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  NumberFormat.currency(
                    symbol: 'IDR', decimalDigits: 0, locale: 'id-ID'
                  ).format(shoes.price),
                  style: greyFontStyle.copyWith(fontSize: 13),
                )
              ],
            )),
        Rating(shoes.rate)
      ],
    );
  }
}
