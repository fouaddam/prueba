class Product {

  late  String productName;
  late  String productUrl;
  late  String currentPrice;
  late  String oldPrice;
  late bool isLiked;
  late bool isMan;


  Product(this.productName, this.productUrl, this.currentPrice, this.oldPrice,
      this.isLiked,this.isMan);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||

          other is Product &&
          runtimeType == other.runtimeType &&
          productName == other.productName;

  @override
  int get hashCode => productName.hashCode;
}