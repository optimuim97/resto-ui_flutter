import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItems(Order order) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            // color: Colors.red,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(order.food.imageUrl), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.food.name,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0),
                        Text(order.restaurant.name),
                        SizedBox(height: 10.0),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(width: 2)),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  order.quantity.toString(),
                                  style: TextStyle(),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '\$ ${order.quantity * order.food.price}',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalprice = 0;
    currentUser.cart.forEach((Order order) {
      totalprice += order.food.price * order.quantity;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Pannier (${currentUser.cart.length})'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.separated(
              itemCount: currentUser.cart.length,
              itemBuilder: (BuildContext context, int index) {
                  Order order = currentUser.cart[index];
                  return _buildCartItems(order);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 1.0, color: Colors.grey);
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Temps estimé', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),),
                    Text('25 min', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Prix Total', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),),
                    Text("\$${totalprice.toStringAsFixed(2)}", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet:Container(
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [

            ]
          ),
          child: FlatButton(
            onPressed: () { print('Okkk'); },
            child: Text('CheckOut', style: TextStyle(fontSize: 30.0, color: Colors.white),),
          ),
        ),
      ) ,
    );
  }
}
