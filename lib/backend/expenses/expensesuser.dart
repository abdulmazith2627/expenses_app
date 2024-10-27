import 'dart:convert';
import 'dart:typed_data';

class Expensesuser {
   Uint8List image;
   String name;
   String productname;
   int price;
   String shopname;
   int userid;

  Expensesuser(
    {
      required this.image,
      required this.name,
      required this.productname,
      required this.price,
      required this.shopname,
      required this.userid

    }
  );

  Map<String, dynamic> toJson() => {
        "userid":userid,
        "name":name,
        "productname":productname,
        "price":price,
        "shopname":shopname,
        "productimage":base64Encode(image)
      };
 factory Expensesuser.fromJson(Map<String, dynamic> json) {
    return Expensesuser(
      image:base64Decode(json['productimage']),
       name:json['name'],
       productname:json['productname'],
       price:json['price'],
       shopname:json['shopname'],
       userid:json['userid']


        
      
         );
  }
      @override
  String toString() {
    return 'Product{name: $name, price: $price,}';
  }
}