import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meme_generator/provider/app_provider.dart';
import 'package:meme_generator/widgets/text_wrapper.dart';

class StackWrapper extends HookConsumerWidget {
  final ValueNotifier<bool> isContainerActive;

  const StackWrapper({
    Key? key,
    required this.isContainerActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBackground = ref.watch(appProvider).selectedBackground;
    final textWidgets = ref.watch(appProvider).textWidgets;

    useEffect(() {
      return null;
    }, [textWidgets.length]);
    // Background Container
    return GestureDetector(
      onTap: () => isContainerActive.value = true,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(
              selectedBackground?.url ?? 'https://picsum.photos/id/237/200/300',
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        // Stack of text widgets
        child: Stack(
          children: [
            ...textWidgets
                .map(
                  (value) => TextWrapper(
                    textElement: value,
                    isContainerActive: isContainerActive,
                    textId: value.id,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
