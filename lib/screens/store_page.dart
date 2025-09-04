import 'package:emall/common/filter/filter_popup.dart';
import 'package:emall/common/widgets/textfield/searchTextfield.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../common/components/product_cart_v.dart';
import '../common/layouts/grid_layout.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            SearchTextField(shadow: false, border: true),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Products',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                  TextButton(
                      isSemanticButton: false,
                      onPressed: () {   showFilterPopup(context);},
                      child: Icon(Iconsax.document_filter, size: 27,color: Colors.black,),
                              )
                ],
              ),
            ),
            GridLayout(itemCount: 8, itemBuilder: (_, index) => ProductCartV())
          ],
        ),
      ),
    );
  }
}
