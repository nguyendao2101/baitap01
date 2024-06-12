// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/manga_detail/manga_detai_agruments.dart';
import 'package:untitled/fearure/manga_detail/manga_detail_controller.dart';
import 'package:untitled/fearure/read_detail/read_detail_argument.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/router/router.dart';

class MangaDetailPage extends StatefulWidget {
  const MangaDetailPage({super.key});

  @override
  State<MangaDetailPage> createState() => _MangaDetailPageState();
}

class _MangaDetailPageState extends State<MangaDetailPage> {
  final argument = Get.arguments as MangaDetailAgruments;
  final controller = Get.put(MangaDetailController());

  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    controller.getMangaDetailData(argument.id);
    controller.getListChapters(argument.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              ImageAssest.backgroundStoryDetail,
              fit: BoxFit.cover,
            ),
          ),
          Obx(
            () => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: controller.getMangaDetailStatus.value ==
                              GetMangaDetailStatus.isLoading
                          ? const Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  child: Image.network(
                                    controller.mangaDetailData.value
                                            ?.coverMobileUrl ??
                                        "",
                                    width: 300,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  controller.mangaDetailData.value?.name ?? '',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  controller
                                          .mangaDetailData.value?.description ??
                                      '',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  controller
                                          .mangaDetailData.value?.team?.name ??
                                      '',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.mangaDetailData.value
                                          ?.newestChapterCreatedAt ??
                                      '',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          toggleFavorite();
                                        },
                                        icon: Icon(
                                            isFavorite
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_border_outlined,
                                            color: isFavorite
                                                ? Colors.red
                                                : Colors.black)),
                                    const Text('Theo dõi'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          AppRouterName.readDetail,
                                          arguments: ReadDetailArgument(
                                            id: controller
                                                .getListChapterData[1].id,
                                            listChapter:
                                                controller.getListChapterData,
                                            index: 1,
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.red, // Màu chữ
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8), // Không bo góc để thành hình chữ nhật
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical:
                                                10), // Padding bên trong nút
                                      ),
                                      child: const Text('Đọc chương đầu'),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          AppRouterName.readDetail,
                                          arguments: ReadDetailArgument(
                                            id: controller
                                                .getListChapterData[controller
                                                        .getListChapterData
                                                        .length -
                                                    1]
                                                .id,
                                            listChapter:
                                                controller.getListChapterData,
                                            index: controller
                                                    .getListChapterData.length -
                                                1,
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red, // Màu nền của nút
                                        onPrimary: Colors.white, // Màu chữ
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8), // Không bo góc để thành hình chữ nhật
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical:
                                                10), // Padding bên trong nút
                                      ),
                                      child: const Text('Đọc chương cuối'),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 0.8,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.getListChapterData.length,
                      itemBuilder: (context, index) {
                        final item = controller.getListChapterData[index];

                        return ListTile(
                          title: Text("Chapter ${index + 1}: ${item.name}"),
                          onTap: () {
                            Get.toNamed(
                              AppRouterName.readDetail,
                              arguments: ReadDetailArgument(
                                id: item.id,
                                listChapter: controller.getListChapterData,
                                index: index,
                              ),
                            );
                          },
                        );
                      },
                      shrinkWrap: true,
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
