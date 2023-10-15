import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/components/molecules/bottom_sheet/base_bottom_sheet.dart';

import 'package:test_project/app/core/utils/theming/app_colors.dart';
import 'package:test_project/app/core/utils/theming/app_fonts.dart';

import '../../../../app/components/atoms/loading_atom.dart';
import '../../../../app/components/molecules/custom_button.dart';
import '../../../../app/components/elements/shop_avatar.dart';
import '../../../../app/components/atoms/keyboard_disable_atom.dart';
import '../../../../app/components/elements/title_icon.dart';
import '../../../../app/components/molecules/underlined_bordered_text_field_molecule.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../../../../app/core/utils/value_managers/assets_manager.dart';
import '../../../../domain/entites/profile_entity.dart';

final _profileJson = {
  "firstName": "Deliveryboy",
  "lastName": "Githubit",
  "phoneNumber": "1234333",
  "email": "delivery@githubit.com",
  "imgUrl":
      "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFRgSEhUYEhIYEhIREhIYGBIRGBgSGBgZGRkYGBgcIS4lHB4rIRgZJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGhISHDEhJSQ0NDQ0NDQ0NDQxNDQ0NDQ0NDE0NDQ0NDQ1NDQ0NDE0NDQ0NDE0NDQ0NDQ0NDQ0NDQ0NP/AABEIAOcA2gMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAADAQIEBQYAB//EADwQAAIBAgQEBAQDBwQBBQAAAAECAAMRBBIhMQVBUWEGEyJxMoGRoRRCUgdicrHB0eEjM4KSQxZjorLw/8QAGQEAAwEBAQAAAAAAAAAAAAAAAAECAwQF/8QAIhEBAQACAwEBAAIDAQAAAAAAAAECERIhMQNBYXEyUaEi/9oADAMBAAIRAxEAPwAoEIhjBCLGgQGPQxiwl5IEEIjQQjhAJCmEUyOsKpgEhTCKYBTCKYKGBhUMjqY9XgEiOAgGqgC5IA6kgTvxSDd13tuN5ISRHCRBjU/UN7bHf6RyYtDs663tr03ho0oGLeDSoGF1IYciCDHAxA+dGgxbxAoEcBGiKBAzhHCNEcsRnCPEZFBgBBFjRFvAnnKwgg1jwZszEWPWMWEAiBywgglMeIAVYQGBWFWAFBhFeQsRi0SwdrE/CurMfZRqYQXdRYlcwJ1Bptpv8WqrzJgcGfE65Vte43YD6DeAxjVAtwcxvYgKSCOoAOY+40lFTq+Uw9Tmx5rgQDrzI1A+8lcQ4gKiMq2Y2DgkZtB+ZmDDLpewU8/aPRpuBxIZjnyg25pVQ/MMLt7AyNxyqFZTfKbG9zUpkdMxpn0b/mBvMxhOLsHsHYXuAM9ZPpnuE97zuKY7MFykEqWsEvTCg2+F/ic6a5hYypiW2x4PXLKdWbmDelV07OumXuwvIXE8R/q+h7MVHpVxma2+Un0OdPhsCOsy/DOIgBs9hqCc6A3PXKhAc/xWEFxHiJZywv5Zy7ohBsLeummg91N/e0OI23uCdWQM2UPYhmOak2/6PiH115QFLi7o7I7MVDaGxbKt7Aup1yn9Y062MqsBxUogu5AC3sKlOm3XQ2eof+VpX8Nxpeoi/EM+YauRe+pR11RjzRvSeo1i4ntv04hb48ttrqynW+gte8nU3BFwbiZbi+JXIFJOu4K0NFXUkqhJYDS4uDa5Goh+EO+TMbkgkAltctgbBrf6i8w+lxa+oMi4hprxQZXcP4itRb3sblSNten/AO33EnKJOjFBjgYwCPUST2eIqiII4CMjhEnToG85vODQYM4GbskhTDI0jI8KrRWAdYQGARoVDJ0YqmNxOKCAXuSxyqoBJJ7ARVkHibhkJWxA1/8AJY2vfRNXGjabeneBwDilTKucnY2IzvT6X1S5NtL92tykHDcVNsoAHP4agBPLMzm7Aak+0rzj0GZACTY2Vgqeo7EIp9Ci+28rWsDcanqST/OaTE0riGIDsWVt92ZaZLNzbbQdpFbGtbKzFhvyFz1NpDrVJAfEW5xhY1MXI74qQHxMAcRDY0s/xULTxPeU/nxfxBi2NNDSxXKTMHihTcstrlbMCMyn3XY+5mWXFGGTFHrHstNXWx71GTKbAW+BadMq19HWwAzDvuLgzTNjEpURZkawyjIMM9m1LMoDMw/MwXtaedYfGEHeXlPF+YmTQG4ZW5qwNw3f2is2bacEa6PUC2zEDRXIuut1t+Uk5lO4DW5TR8KxQq01qDmLHnZhoRMNS4iiUlp01IBIpD0FTYgklStVtbBradJq/D4yM1LTSnTdgCTlqEsGFiBYXGnYDneZ5QL0COWIBHCZHoohAI0CPAgZsdFAi5YjeWgxwMGrRymdLEZYVTApCiIxlhUMAhhgYgdXb0N/CZmsRjvLurGw9IJ1Nhp8R2uQLBF6zQ4pbo2ttL33tYg3tz22mVxddSQGX1A6A2JS4ZsvuBlv7ysYcV+LqWJsApJLFQAouddhK2pVO95M4lUBN+dpT1Xl0za1UyG7wjtI7GRQa0lU+F1mF1Qn5i8JwGjnq3Oyi83nBjRY5Q6XHcTPPPXjbDCZTt50cBWBK+W5I3ABa3vaDdWU2cFT3E9yocNQjMuX1bkW1t3ldxfgiMLFVPMaAyJ9f4O/H+XjqtJCPprC8Ww+SrUQC2UhlG1gbX+WsiqJtLtjZqpSVJKw1cjnK4QtNpUpNxwHEAlSbZlYMuYFgDtewIPPqN5vvCTF1eu2rP5YAzFytNVOVCWJYfEWsTs4nlfA6huLC7XAVRuzE2AHubT2XgmANCktNmL1Dd6jkliXbkCeQFlHZRFn4IsRHCIBHCYmcseojVjxJM4CdOEWAeSAwqGBWFSdDMVTCrBJCrEBVhlgVhVk2AbLcEdQRMXxLKrlWA8xTkJ2tcn+ZU67nSbRZReJ+GlwKyLmZRd1AJJABswA3Iufr2lY3tTD4x7GQHaSsY4JuOpB9xILGXShrQTCEJjGMRrzgHDScwGuZAQL9z/iTE4FmazJkItYqri7X112taO8J4gAhtyFCkcwQZteJ8RppQZ7qrHQXIX7zmytldWOONxlQcXwWo2CQ0ndHV3z2J1CjlbXlKjg/B6ztdXqO6tqfMZiFtuVKi2vK5vL3gHjZQtOiyUlUPlLGqVPq0JUMvqAO97Ta1sciLmQDUX0sR8rcpPKzqxVmOV6eMeL+HutVmYWtTRWOou172HfSZtDPQvGVUFKlYscz5KYUnQtm0IHYFtZ58Fm3yu4x+smOR1oWmIOlTLEKoJJNgACST0A5z0/wZ4BIK18YtrWZKB1JPIv0/h+vSaWyesR/wBnvhogLiqy2GhooeZ/WR06fWeiARAOkeJlld0FnTosQPWOEGDCCIzhHRt50A8lQwiwaCGUToQeghkEYgkhFiIqiFVZyJDKkm03KsKqzgsIqxBlfEPhUVL1KAC1DctTNgrnqD+Vvse08/x2Cem2SojU2/Swsfl1HcT21VjcTgkqLlqItRejKG+l9pXISvCGEGRPWsZ4Cwz38svSP7pDr9G/vKev+zV//HiEPZkZfuCY9w+UZHgNVkZgi52KghLhb2Otr87GFxGDxNZ81RSgGgza2H7qiLxThf4Z1Ar06j3P+0xYrb9WmntDUfETqLOAx5N1mWV76dOONuEy/Dn4KHWympn3DMq5SexGtpN4b+OpL5YdRT2s5Ygd100jMB4scNlKFr6AWvLKvjSMtSut6edF8pSVLKT6/UNR6bnSFv8As8cd2cfVF4joOayKWL56VOrSVcz+lriyqOZKk6dZZcF8AYuvZqi/hqZ1zVPjt+7TGv8A2yz1bgmBSnSp5UVW8tBmAF8urBc29hmsBLS0cusY5sst5VReHfCWGwYzU1z1ba1nsz/8eSD2mgAiLHCK3aXWigRYkSi2igRLxwgCgR6xl4t4ASdEUx0A8pRYVFjVEOs22g5EklVjEEOok2gqQyCDRJIRYAqrCqkciQwsASdABck6ADqYgGEi2ABJIAGpJ0A+cpsT4kS5WkM9tMzaKT2G5me4hinqktUcsoPwbADXYDSLkvH52+tBjvFFKn/tq1Y8ytlQe7nf5AzHca8SVsVmQA0aagehGYlidPW2lx2tb3gmIyenY3P2kfhxVs4BGcsoy3GbKBfb3hL+r4SKd8INC1woIzFRcheZA56Sbxjw9UoqKotWw7AMtVQfhOxYcv5fylnVQA7WOgIItbrNJ4GxinPgagDhcz0lPOnuVHdQbjt7RZf+u2uH0vz3+xkuEJQyCqXIZdGpgB2J6qLg27nQdZIqo9bzayI7U6NJmIsCFFrm9tATppcmwh/E3CfIxjeWyqjqjroLAuCApH/H7z0/9nWBoNw9VQE58wxGa2bzr2dSOQFgB2tM5OWWrXbbj8vnPrjO75/qM/4R8Y06lFFxFqbhVQv+QkCwJP5fnp3m0B6ajcHfSeH4emMNi6+EOiJWqU1vyAY5CfkbTQ8N41WwzFEJNIbU3BKWG4TmLdus0y66eXx33HqIjhMxw3xdTdslRfKJ0DZsy37mwtNIGiTcbPRQIthBh4oaMjiIogi04mJQsW8BeEBgBUMfeBzTs0YearCpI9OSUMq1KQiyWgkam0k04tgZVhqaQaGHSGxoVVmT8dcUZAlBDYMpd+6g2Ue1wT8hNapnlXi7FmpiqmuiMKa+yaH73+sJ3TnqA3EraE2MVOJEkXbfl2lPiN9fkZEquR2ZTmXuDof6TTjF8qvMFirZ/wBIqHTtzk/hiUqgZqgDAFVy21tuDfcSgpMcgHNtT85Jwdby6lzpTYBH7Dk3yMWWPRzJo69UNa2mmUDU2A5XkSvXelWSpTORwFZG6OpO/UGwiVgwfKdNRbnfoRG8RbPa+mhF++lpEmlXuO4nxL8TXrEqVLCmyJ+llQKbds17Td/ss4wFc0ibLXAcdsQq2bT94A/9RPOaSEkONHT/AOSg6iSeEY1qbFqZs6ur0j0YEg6dNNfnMspcctx6nyyx+3wuGX5L/wA8C8Y4oHiNaovwvVqfZiAftLCjjM6fvqLn94df6TOcfBJz7m979TfePwmKICuPn3HMTos3I8mXVXCYu2+oBymei+BuKmrTemzZjTZct9/LcHKL87FW+08px4sMym4YAj36TU/s2xWXEtTvo+Hy+7IQR9s0m49bGV309VDRwaCWcXkoEJiEweaI79IA/NCo8ho5hFeASHeJ5hgS07NAPOUeSqdSV6PJdIwGk2mZOpvIVC0kqYBMVoRHkRWhVaCUupXCKztoqqWJ7AXM8bxdUu7VDoXdnP8AyN/6z0TxljcmGZR8TstMe27fYfeedINRKxisUbEJcd5XVrmy73NgeYlniND2leFu6jpczSCpiJqOwj6igqQed5zaRGgY3COJG4oVDmt/tsbEi35bmTcTUuwvrfMCOszWIurBhuGB+msvMRUHoYbXv9R/mTcezl6ddkJKNdbXyt6gBfUA7j6yRQdVys6OrVFDroCCh/TqNDvfS8hYljkYDmpt7zR8bRadYHKopPTpIzKPhbLmVh29RAF9BYRZaVjlZ5VZj6QdPSthY6kgm/y2mfwZ9BB1ysQRtvNSzFRlYAj8p7TOYpMlQ2+FxmHuN48aWUSMmdHVSFyjPrcnbl3Npa+BcRlxtMnmzJ/2UqP5iU3DaozkW3Rh847gdYrVDjQqysPkbx3ype/B4x3g0qBlDDYgMPY6wLvMkD+ZEL95Gd43NAJSvHeZIyvHhoKHDx2aBJiZog88QyXSeQlMOhjUtKLyWjypp1JPpvpBKSrwytIoePD6Q2NMt45xOZ6dPkqM592Nh/8AX7zM0TrLXxDUz4hzyXKg/wCI1+5MqmcA6CaTxUBx6WEgYPVyewEJjsQb67QXD+Z7yk/qcdYqjWcsch9UDRMVTuRDs/pRb7Zx9CLR7073I5BiL9AL/wBJDxdyVy6ekn6sf7QJo+BYSlXxFGjXv5b1Mj5bgm6mwuNdWsPny3mu/aBwk03R6dmpvTCVEdizeiwvdjcnXfUnKxPWYvwTWP47Cq+gNdNde89C8YYhErphahL0zQR8zXNi1SplOmthltca2JmGeWs5F49xiuCU87+XU1pqrvUBOUhEUkm/LWw+coOKW9LaXDWNiTvpueU02OqKlNlpWWo+VXYVFrE0lJNsygABjbTcga6ETOcTp5kJtY2v85pj7sXxCwVxUW5t6rW63j+Hel3/AHXI+hIkMVPUjc7rcyycZXcgfEc313+8qoj17w/jM+Gpnf0BD7r6f6SaWmU8C4q9F6ZOqVLj+Fh/cGabzBM70LDiYl4maNLSQKsOhkRXhkeASDOjQ07zIG85VoVHkJa0etS0vRp1OpJ1GpKxHkmi0VC0R4QvK1atoRquht0MRMTi6zO72F71HOndjIzhk+IrbpcRaDmwUG2mp5kmK2CB1LG/sP7zXw1ZjjcXE7BGwGl9+kl0eHGtXp4VHGapVSkpOwLsFu1uQveFxXDWw9Wphqls9Oo1NrXIJU7i/I6Ee8aTVY/p+4jqSm9zp01vFIsNYmaBucwDNdz2sPtH1L301kNHOZv4j/OEJqvBqKcdhrsqAVQbsQv5W0BPPt9NZqPHVOmmMpric1dBhAGyPaoD5lRgbXuB61AJ5X3taebhza4JVgbqwJBDDYgjYiSsVxR6+Ieu5JLBFAZs2VR+UHTT5c/nM8sN5TJUqS7W0DE9CeciYqt6SOsTzCZExvw/OXILVffQdjb7y6x1RkZCp3BDX6ix/rKJDy/eE9H8PeHqOLqtTxDGmi0HqioMllZLavm/LYkm1thC0pPS+CMbmdlNrtTv81P+ZsZgOAUHp4wBVU0s1RFqKLB1s2V7HUXsNDteb9Zll6Zc04GcqwwpxbBEEKIy1o4PJtGjxEvOBnRbGnliPDq0joIRZ0BMpvaSqbyvQwqvJoTi84VZD8ydni0GWsN2JB/SNIQVA4yszL0A2PuY2hYMQTa3a5hnJN7W+f8AiaUkfhWMXC4ujiMvmCnUWpkuBcjb76y68XeIlx1YV1oDDsFyuVfOXtbKzekWIGmnK3SZXFA5hmI35SQr9I9EmO1wILNBAkw9Kn1gBkqnLkCr8RYVNQy6AHUbiw0B2NzzkKiBz636yZjWCLYfEwIHO19zK5PaEOp+VbbzuHlfXezDNlIuRdSo6HqJCLm2xg6JdVzBSQWOum/fn0hYW1uUTlp2kPHKLSKKjnYH32EHXuNSflDQtQzvNjQxZrYclGKuAqVCNCDoL9wbfzmNMlYPEFDoSAwyNboefuDqPaRZtUum28PVj5iLUdKj51CEaNbmDN8s848P4NfxNItkzq5bMoyZhlY+pet7T0bMJnl1TFDiPV7yPCgWmewI060QNFvDYKDOuYsS0XIaeWgx6mBEUNOkkrNODSOGjgYjHzxC8GDHgQ0GdqIS7ZdLM1/rJCAjnmNtoLEm1Rxt6r/UAwyNpobfWaJVmOHqGlt5yPF4iNje5vISsYbJaioIhxOX1HYa26mQEJ35dTtHVkJC21uCbc+l7d4WiGnFMWLsbk7+3QSwpVRzlWVK7gj3BEJTYdbdjt9YpRVsag7RmBxHxU9j0/UoJI+YvK017dL/AFt3g1dhqCb3DA359YU4vioOsq+IDUSZTrZgCo33A5NzEhYxxqOfQa294xUCGw1PMyr1I+nOdhsM1R1popZ2IVVG5JnpPBf2ZsCDVxdCnUIt5Yu5F+V7jX5SYPEDhT+tP4lP0muFWUuP4BWwVZFq2ZWLeXUU3VrDUa6g6jQ/eSlrTPLFcu1tTrQrYiVC1YQVJnxCyWtCrWlWtSFWpDiqVYitH+cJXrVjvMk8aOUeeFpyxl4oM6UHx2eCzToAdXj1aRgYQNAKriq/6l+qg+51H9o6m1xF4qnqU/u2t7H/AD9pDp4pV0Jv2UXlfif12PS6/eP4Twx6uUoQQatOlU01QubKSP0mx166G1xeQCWQsKVTKASzZdAvU6yT4CxAXEhWAZXUix/9tlrg/wDaisnLLrcVJ32pq+HJZVJ/JnY32G5PaTaPB3qepAjg2ChHpsbchkvm+0l8QpZaFWo6MjucPTpBlZboVJZhfcehh8+0z9HLzuD11hO/BlrGr0cGxKkL5VRCTZQUdc1+QUj1fSLiuFVKbL+IFOldiSSaTutlLZmp0yWsLXIK3lfh8XUQEU61RVIsVV3VSOhAOsEuZWD02KODcOpZWB6hgbgx6o5T8ajC56dMkUcTlAZvNK0adJuh8ypTsFMrhgWxAzLSpNUb1PU/E0abMx3JplwF9rD2lRTqOtTzVqMtS5bzFJVsx3bNvc3OveBNG+pJJOpO5JPMmLhRyjS/+lK9Fc9ah6GsbDFYemCOzZjeQMPwo1HApUHQBhmZ6iVadgbmxVBm+RMp2zIbqx0II15jUS/reKa1YDziAbKrsoys6juNj3isyPG433psOEcIpLV802zBcl1JUKtthbYw/EeDYJUYCmilgfVbUHrfrM9h+NUlS1N+XwnQj3kdqz1dWYqn3I7f3mPHO3tvywk6T+H8TqPhKVGozP5WLrOjsSxNEU8irc8szt8lkpakhIVtYelVWyL8xz+phgU/UfzX+unLmNZt/bm/ektasIK0iejcNcZdOubpblHIF19WxsL6XXr/AIk2w/U9Kt4/PIiOnNj3Hyjy620a50kb7GkoVI7zZC8yd5ko2TBnTp00Iojp06MOM5WnToADG4UVFtcgi9j/AEPaSuAcJVRmYB2vv2+c6dM/p/iv5ycnoPCKKBCMtwRqP5iYrhSjC8QqUEQWYtkJI9K5S4toToLidOmOHl/pp9Pz+yeM8c1ak4ewajXpUzlLWKHzcpsed+nU6CYynRvsYk6dHxnTDP0X8O1t4opkbm86dNUGOTbttDKbjtedOgDW3t1GnvIzN9L6jv1E6dFQmcJwiu5zahQDYXFydtZpROnQBwMes6dACCPBnToqIephFedOmdXBFaOzTp0Rv//Z",
};

const _imgUrl = ImgManager.defaultProfileImg;
// "https://sainte-anastasie.org/img/images/las-50-mejores-frases-de-emiliano-zapata-el-mtico-revolucionario-mexicano.jpg";

final ProfileSettingsEntity _myProfileModel = ProfileSettingsEntity(
    firstName: "admin",
    lastName: "",
    phoneNumber: "1234333",
    email: "",
    imgUrl: _imgUrl);

class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet({Key? key}) : super(key: key);

  @override
  State<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  ProfileSettingsEntity? profileModel;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchData();
    });
  }

  void fetchData() {
    setState(() {
      profileModel = ProfileSettingsEntity.fromJson(json: _profileJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(profileSettingsProvider);
    const bool isLoading = false; //profileModel != null;
    return isLoading //state.isLoading || state.userData == null
        ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: LoadingAtom(),
          )
        : BaseBottomSheet(
            // height: 900.h,
            child: KeyboardDisableAtom(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        TitleAndIcon(title: AppStrings.profileSettings),
                        24.verticalSpace,
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                ShopAvatar(
                                  radius: 16,
                                  imageUrl: _myProfileModel
                                      .imgUrl, //profileModel?.imgUrl,
                                  // path: imageState.path,
                                  size: 50,
                                  padding: 6,
                                  bgColor:
                                      AppColors.blackColor.withOpacity(0.27),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color:
                                        AppColors.blackColor.withOpacity(0.27),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    FlutterRemix.camera_fill,
                                    color: AppColors.white,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    // TODO
                                    // final XFile? pickedFile =
                                    //     await ImagePicker().pickImage(
                                    //   source: ImageSource.gallery,
                                    //   maxWidth: 1000,
                                    //   maxHeight: 1000,
                                    //   imageQuality: 90,
                                    // );
                                    // if (pickedFile != null) {
                                    //   ref
                                    //       .read(profileImageProvider.notifier)
                                    //       .changePhoto(
                                    //         context: context,
                                    //         path: pickedFile.path,
                                    //         firstname: state.userData?.firstname,
                                    //       );
                                    // }
                                  },
                                )
                              ],
                            ),
                            16.horizontalSpace,
                            Expanded(
                              child: UnderlinedBorderTextFieldMolecule(
                                label: AppStrings.firstName,
                                initialText: _myProfileModel.firstName,
                                onChanged: (val) {}, // TODO
                                descriptionText:
                                    true //_myProfileModel.isFirstnameError
                                        ? ""
                                        // '''AppHelpers.getTranslation(
                                        // TrKeys.firstnameCannotBeEmpty)'''
                                        : null,
                                isError:
                                    false, //_myProfileModel.isFirstnameError,
                              ),
                            ),
                          ],
                        ),
                        24.verticalSpace,
                        UnderlinedBorderTextFieldMolecule(
                          label: AppStrings.lastName,
                          initialText: _myProfileModel.lastName,
                          onChanged: (val) {},
                          // isError: _myProfileModel.isLastnameError,
                        ),
                        24.verticalSpace,
                        UnderlinedBorderTextFieldMolecule(
                          label: AppStrings.phoneNumber,
                          initialText: _myProfileModel.phoneNumber,
                          inputType: TextInputType.phone,
                          // TODO
                          // readOnly: !_myProfileModel.isPhoneEditable,
                          onChanged: (val) {},
                        ),
                        24.verticalSpace,
                        UnderlinedBorderTextFieldMolecule(
                          label: AppStrings.userName,
                          initialText: _myProfileModel.email,
                          inputType: TextInputType.emailAddress,
                          // readOnly: !_myProfileModel.isEmailEditable,
                          onChanged: (val) {},
                        ),
                        24.verticalSpace,
                        UnderlinedBorderTextFieldMolecule(
                          label: AppStrings.password,
                          // TODO
                          obscure: false,
                          onChanged: (vla) {},
                          // isError: _myProfileModel.isPasswordError,
                          // descriptionText: _myProfileModel.isPasswordError
                          //     ? AppHelpers.getTranslation(
                          //         TrKeys.passwordShouldContainMinimum6Characters)
                          //     : null,P
                          suffixIcon: IconButton(
                            splashRadius: 25,
                            icon: const Icon(
                              false
                                  ? FlutterRemix.eye_line
                                  : FlutterRemix.eye_close_line,
                              color: AppColors.blackColor,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        24.verticalSpace,
                        UnderlinedBorderTextFieldMolecule(
                          label: AppStrings.confirmPassword,
                          obscure:
                              false, // TODO _myProfileModel.showConfirmPassword,
                          onChanged: (vla) {},
                          // isError: _myProfileModel.isConfirmPasswordError,
                          // descriptionText: _myProfileModel.isConfirmPasswordError
                          //     ? AppHelpers.getTranslation(TrKeys
                          //         .confirmPasswordDoesntMatchWithNewPassword)
                          //     : null,
                          suffixIcon: IconButton(
                            splashRadius: 25,
                            icon: const Icon(
                              // TODO
                              false
                                  ? FlutterRemix.eye_line
                                  : FlutterRemix.eye_close_line,
                              color: AppColors.blackColor,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      // TODO
                      // showCustomModalBottomSheet(
                      //   paddingTop: 120,
                      //   context: context,
                      //   widget: const EditCar(),
                      //   isDarkMode: false,
                      //   // isExpanded: true,
                      // );
                    },
                    child: Container(
                      color: AppColors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            const Icon(
                              FlutterRemix.time_fill,
                              size: 20,
                            ),
                            8.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.deliveryVehicle,
                                  style: AppFontStyles.interNormal(
                                      size: 12, color: AppColors.blackColor),
                                ),
                                Text(
                                  // TODO
                                  "temp text",
                                  //"${LocalStorage.instance.getDeliveryInfo()?.data?.number} — ${LocalStorage.instance.getDeliveryInfo()?.data?.model}, ${LocalStorage.instance.getDeliveryInfo()?.data?.color}",
                                  style: AppFontStyles.interNormal(
                                      size: 12, color: AppColors.blackColor),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(FlutterRemix.arrow_right_s_line)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: CustomButton(
                      title: AppStrings.save,
                      // TODO
                      // isLoading: _myProfileModel.isLoading,
                      onPressed: () {
                        // editNotifier.updateGeneralInfo(
                        //   context: context,
                        //   checkYourNetwork: () {
                        //     AppHelpers.showCheckTopSnackBar(
                        //       context,
                        //       AppHelpers.getTranslation(
                        //           TrKeys.checkYourNetworkConnection),
                        //     );
                        //   },
                        //   updated: context.popRoute,
                        // );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
