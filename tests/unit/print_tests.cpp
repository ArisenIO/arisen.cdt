#include <arisen/arisen.hpp>
#include <arisen/tester.hpp>

using namespace arisen::native;

ARISEN_TEST_BEGIN(print_test)
   CHECK_PRINT("27", [](){ arisen::print((uint8_t)27); });
   CHECK_PRINT("34", [](){ arisen::print((int)34); });
   CHECK_PRINT([](std::string s){return s[0] == 'a';},  [](){ arisen::print((char)'a'); });
   CHECK_PRINT([](std::string s){return s[0] == 'b';},  [](){ arisen::print((int8_t)'b'); });
   CHECK_PRINT("202", [](){ arisen::print((unsigned int)202); });
   CHECK_PRINT("-202", [](){ arisen::print((int)-202); });
   CHECK_PRINT("707", [](){ arisen::print((unsigned long)707); });
   CHECK_PRINT("-707", [](){ arisen::print((long)-707); });
   CHECK_PRINT("909", [](){ arisen::print((unsigned long long)909); });
   CHECK_PRINT("-909", [](){ arisen::print((long long)-909); });
   CHECK_PRINT("404", [](){ arisen::print((uint32_t)404); });
   CHECK_PRINT("-404", [](){ arisen::print((int32_t)-404); });
   CHECK_PRINT("404000000", [](){ arisen::print((uint64_t)404000000); });
   CHECK_PRINT("-404000000", [](){ arisen::print((int64_t)-404000000); });
   CHECK_PRINT("0x0066000000000000", [](){ arisen::print((uint128_t)102); });
   CHECK_PRINT("0xffffff9affffffffffffffffffffffff", [](){ arisen::print((int128_t)-102); });
ARISEN_TEST_END

int main(int argc, char** argv) {
   bool verbose = false;
   if( argc >= 2 && std::strcmp( argv[1], "-v" ) == 0 ) {
      verbose = true;
   }
   silence_output(!verbose);

   ARISEN_TEST(print_test);
   return has_failed();
}
