import 'package:app/controllers/categories_controller.dart';
import 'package:app/models/categories_model.dart';
import 'package:app/widgets/category_card.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final CategoriesController _controller = CategoriesController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoriesModel>>(
      future: _controller.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Hiển thị widget đang tải khi dữ liệu chưa sẵn sàng
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Hiển thị lỗi nếu có sự cố khi tải dữ liệu
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          // Dữ liệu đã sẵn sàng, xây dựng ListView của CategoryItem
          return SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length, // Số lượng item dựa vào dữ liệu
              itemBuilder: (context, index) {
                // Lấy từng category model từ snapshot
                final category = snapshot.data![index];
                return CategoryItem(
                  iconData:
                      'assets/coffee-cup-coffee-svgrepo-com.svg', // Giả sử mọi danh mục đều sử dụng icon này
                  title: category.name, // Sử dụng tên danh mục từ API
                  isSelected: index == 0, // Giả sử danh mục đầu tiên được chọn
                );
              },
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          );
        } else {
          // Hiển thị thông báo không có dữ liệu
          return const Center(child: Text("No categories found"));
        }
      },
    );
  }
}
