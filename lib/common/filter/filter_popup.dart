import 'package:emall/common/filter/filter.controller.dart';
import 'package:emall/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

void showFilterPopup(BuildContext context) {
  final filterController = Get.put(FilterController());

  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Apply Filters',
                        style: GoogleFonts.openSans(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Iconsax.close_square_copy, size: 25,color: Colors.black,))
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Categories',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Wrap(
                    spacing: 10,
                    children: ['T-shirt', 'Jeans', 'Shoes']
                        .map((cat) => ChoiceChip(
                              selectedColor: primaryColor,
                              label: Text(cat),
                              selected:
                                  filterController.selectedCategory.value ==
                                      cat,
                              onSelected: (_) =>
                                  filterController.selectedCategory.value = cat,
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Gender',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Wrap(
                    spacing: 10,
                    children: ['Man', 'Women', 'Kids']
                        .map((gender) => ChoiceChip(
                              selectedColor: primaryColor,
                              label: Text(gender),
                              selected: filterController.selectedGender.value ==
                                  gender,
                              onSelected: (_) => filterController
                                  .selectedGender.value = gender,
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Size',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Wrap(
                    spacing: 10,
                    children: ['S', 'M', 'L', 'XL']
                        .map((size) => ChoiceChip(
                              selectedColor: primaryColor,
                              label: Text(size),
                              selected:
                                  filterController.selectedSize.value == size,
                              onSelected: (_) =>
                                  filterController.selectedSize.value = size,
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'On Sale',
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Switch(
                        activeColor: primaryColor,
                        value: filterController.isPromo.value,
                        onChanged: (val) =>
                            filterController.isPromo.value = val,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arrivals',
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Switch(
                        activeColor: primaryColor,
                        value: filterController.isNew.value,
                        onChanged: (val) => filterController.isNew.value = val,
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Color.fromARGB(255, 221, 219, 219)),
                              side: WidgetStatePropertyAll(BorderSide.none)),
                          onPressed: () {
                            filterController.resetFilters();
                          },
                          child: Text(
                            "Reset",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(primaryColor)),
                          onPressed: () {
                            filterController.applyFilters();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Filter",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    ),
  );
}
