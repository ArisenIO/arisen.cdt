/**
 *  @file
 *  @copyright defined in arisen.cdt/LICENSE.txt
 */

#include <arisen/tester.hpp>
#include <arisen/crypto.hpp>

using arisen::public_key;
using arisen::signature;

// Definitions in `arisen.cdt/libraries/arisen/crypto.hpp`
ARISEN_TEST_BEGIN(public_key_type_test)
   // -----------------------------------------------------
   // bool operator==(const public_key&, const public_key&)
   CHECK_EQUAL( (public_key{0, std::array<char, 33>{}}  == public_key{0, std::array<char, 33>{}}), true  )
   CHECK_EQUAL( (public_key{0, std::array<char, 33>{1}} == public_key{0, std::array<char, 33>{}}), false )

   // -----------------------------------------------------
   // bool operator!=(const public_key&, const public_key&)
   CHECK_EQUAL( (public_key{0, std::array<char, 33>{}}  != public_key{0, std::array<char, 33>{}}), false )
   CHECK_EQUAL( (public_key{0, std::array<char, 33>{1}} != public_key{0, std::array<char, 33>{}}), true  )
ARISEN_TEST_END

// Definitions in `arisen.cdt/libraries/arisen/crypto.hpp`
ARISEN_TEST_BEGIN(signature_type_test)
   // ---------------------------------------------------
   // bool operator==(const signature&, const signature&)
   CHECK_EQUAL( (signature{0, std::array<char, 65>{}}  == signature{0, std::array<char, 65>{}}), true  )
   CHECK_EQUAL( (signature{0, std::array<char, 65>{1}} == signature{0, std::array<char, 65>{}}), false )

   // ---------------------------------------------------
   // bool operator!=(const signature&, const signature&)
   CHECK_EQUAL( (signature{0, std::array<char, 65>{1}} != signature{0, std::array<char, 65>{}}), true  )
   CHECK_EQUAL( (signature{0, std::array<char, 65>{}}  != signature{0, std::array<char, 65>{}}), false )
ARISEN_TEST_END

int main(int argc, char* argv[]) {
   bool verbose = false;
   if( argc >= 2 && std::strcmp( argv[1], "-v" ) == 0 ) {
      verbose = true;
   }
   silence_output(!verbose);

   ARISEN_TEST(public_key_type_test)
   ARISEN_TEST(signature_type_test)
   return has_failed();
}
