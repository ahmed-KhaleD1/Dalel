import 'package:dalel/core/models/historical_data_model.dart';
import 'package:dalel/features/home/presentation/widgets/custom_home_view_app_bar.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/historical_characters_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/historical_periods_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/historical_souvenirs_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/home_app_bar_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  final List<HistoricalDataModel> items = const [
    // HistoricalDataModel(
    //     image:
    //         'https://s3-alpha-sig.figma.com/img/f929/a74b/bff892b0679ea9c73f650b537cb7cc6e?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dENk3LLFMQojXzvltfZi3pxVj9aMNrqUtIql~t6w873Tgr7xSb5rnpwWBUGNJP6Y6u~~M-uG5UkMEvcCmptMm5xzm0nEFS-0-dqJ6ccGIdHVTHsUtEOGZFTQwcMHEB8unJ3Fc6tBxCBci3Ob7dwUi5WDKvQJbl8ZTFyFxClb6r7~9nm8f7F~vYHoB5Jpz7EOM9SaffJTClLNVItyFKZFwCtogJiaIulWmUftntCZpPHdhh38fNFtkXIu1sOC5eRr5K2ob7YkL54MUCKicVSd5JGgYLKdUI7es8RgWydN~Mvyl~urLIkwQ4s46W~ebUuzw2WY9rth8eSD8VwhVsXpfg__',
    //     title: 'Ancient Egypt'),
    // HistoricalDataModel(
    //     image:
    //         'https://s3-alpha-sig.figma.com/img/7a29/c1fa/aaf94b14ee1489902b9288acd42ff523?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZtA5KzFjik~WAWgykxhSLl4pSWcNPKZRhtZQgcvqnc6GaBekAsb-tSI8mMZKd4Up04tx4dVi6bcBcziU6Ic6L3mMSSlCPcH4k7uZ~QcAqnS3j22fFLXKnPY5~nEdkPacVYNHBh4mZggv9VRd5mF7C23WPHukwvbXTFvTgnlq1zF9pXzdBgSQFjV0uYYZ4pVh2WYSFq-6UUP-cjnWQfPXsz9QlkVtBHMcPy6BYgmeu-WAlDRNwrp8O~rNBnoGtLHJ1sj~Z1dA0Y0I4MxComC96Z5bmOWOGuJqNBCNG~Zu9XI9BWUIc2DH6N50MtBd-oR6QJTdkU-IPxdiMHs77xlhPQ__',
    //     title: 'Islamic Era'),
    // HistoricalDataModel(
    //     image:
    //         'https://s3-alpha-sig.figma.com/img/f929/a74b/bff892b0679ea9c73f650b537cb7cc6e?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dENk3LLFMQojXzvltfZi3pxVj9aMNrqUtIql~t6w873Tgr7xSb5rnpwWBUGNJP6Y6u~~M-uG5UkMEvcCmptMm5xzm0nEFS-0-dqJ6ccGIdHVTHsUtEOGZFTQwcMHEB8unJ3Fc6tBxCBci3Ob7dwUi5WDKvQJbl8ZTFyFxClb6r7~9nm8f7F~vYHoB5Jpz7EOM9SaffJTClLNVItyFKZFwCtogJiaIulWmUftntCZpPHdhh38fNFtkXIu1sOC5eRr5K2ob7YkL54MUCKicVSd5JGgYLKdUI7es8RgWydN~Mvyl~urLIkwQ4s46W~ebUuzw2WY9rth8eSD8VwhVsXpfg__',
    //     title: 'Ancient Egypt'),
    // HistoricalDataModel(
    //     image:
    //         'https://s3-alpha-sig.figma.com/img/7a29/c1fa/aaf94b14ee1489902b9288acd42ff523?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZtA5KzFjik~WAWgykxhSLl4pSWcNPKZRhtZQgcvqnc6GaBekAsb-tSI8mMZKd4Up04tx4dVi6bcBcziU6Ic6L3mMSSlCPcH4k7uZ~QcAqnS3j22fFLXKnPY5~nEdkPacVYNHBh4mZggv9VRd5mF7C23WPHukwvbXTFvTgnlq1zF9pXzdBgSQFjV0uYYZ4pVh2WYSFq-6UUP-cjnWQfPXsz9QlkVtBHMcPy6BYgmeu-WAlDRNwrp8O~rNBnoGtLHJ1sj~Z1dA0Y0I4MxComC96Z5bmOWOGuJqNBCNG~Zu9XI9BWUIc2DH6N50MtBd-oR6QJTdkU-IPxdiMHs77xlhPQ__',
    //     title: 'Islamic Era'),
    // HistoricalDataModel(
    //     image:
    //         'https://s3-alpha-sig.figma.com/img/d1f9/20b7/df2f8baea86499b1ee069e3400d0beb9?Expires=1708905600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lAACN0il4wkvZQf-zZOtEn7FvN5FwHvRtg~aIIqIUR3H6IS8xuqCP-WyZdstYQHCVbKHd1-aIEsUAcTzuP8Ib2cQ6pI8p5lsFkfu1XWVggHpG5YlG-TmAcIXXdbYpcDxYsRDB7kFkXLXHWC2eewrEyvgtm8H7ccq5v9bmSuYKIqrnXhktOENXWSz3yTTn49HvYrRpXXIEKE5JRvxEVSCC-bnPP8zLPRMafMz2EqHePfqN8-Qo7FAPb63lalnNyhh1ETvQj~B-PpZC339bDKJp3fb~AuJ6t3S55mZ~BcbYVsgRhEDssBlxulQqVnJVy8qfQf8o16ljExBAg2~O5~hOw__',
    //     title: 'Lionheart'),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const HomeAppbarSection(),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: HistoricalperiodsSection(items: items),
                ),
                SliverToBoxAdapter(
                  child: HistoricalCharacterSection(
                    items: items,
                  ),
                ),
                SliverToBoxAdapter(
                  child: HistoricalSouvenirsSection(items: items),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
