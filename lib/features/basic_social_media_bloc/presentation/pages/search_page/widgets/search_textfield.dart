import 'package:async/async.dart';
import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/search_page_bloc/search_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late CancelableOperation<void> cancelableOperation;

  final _delayTime = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    cancelableOperation = CancelableOperation.fromFuture(
        Future.delayed(_delayTime), onCancel: () {
      debugPrint("Cancelled");
    });
  }

  void _onItemChanged(String value) {
    cancelableOperation.cancel();
    _start();
    cancelableOperation.value.whenComplete(() {
      context.read<SearchPageBloc>().add(SearchUser(value));
    });
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: _onItemChanged,
      onTapOutside: (x) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: const TextStyle(
          color: golbat140,
        ),
        // Add a clear button to the search bar
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear, color: golbat140),
          onPressed: () => _searchController.clear(),
        ),
        // Add a search icon or button to the search bar
        prefixIcon: IconButton(
          icon: const Icon(Icons.search, color: golbat140),
          onPressed: () {
            // Perform the search here
          },
        ),
        filled: true,
        fillColor: normalTextColor.withOpacity(0.3),
        contentPadding: EdgeInsets.symmetric(vertical: 12.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
