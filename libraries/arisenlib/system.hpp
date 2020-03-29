/**
 *  @file
 *  @copyright defined in rsn/LICENSE
 */
#pragma once
#include "system.h"
#include <alloca.h>
#include <string>

#warning "<arisenlib/system.hpp> is deprecated use <arisen/system.hpp>"
namespace arisen {

   /**
    *  @addtogroup system System C++ API
    *  @ingroup core
    *  @brief Defines wrappers over arisen_assert
    *
    *  @{
    */

   /**
    *
    *  @brief Assert if the predicate fails and use the supplied message.
    *
    *  Example:
    *
    *  @code
    *  arisen::check(a == b, "a does not equal b");
    *  @endcode
    */
   inline void check(bool pred, const char* msg) {
      if (!pred) {
         arisen_assert(false, msg);
      }
   }

    /**
    *
    *  @brief Assert if the predicate fails and use the supplied message.
    *
    *  Example:
    *
    *  @code
    *  arisen::check(a == b, "a does not equal b");
    *  @endcode
    */
   inline void check(bool pred, const std::string& msg) {
      if (!pred) {
         arisen_assert(false, msg.c_str());
      }
   }

   /**
    *
    *  @brief Assert if the predicate fails and use the supplied message.
    *
    *  Example:
    *
    *  @code
    *  arisen::check(a == b, "a does not equal b");
    *  @endcode
    */
   inline void check(bool pred, std::string&& msg) {
      if (!pred) {
         arisen_assert(false, msg.c_str());
      }
   }

   /**
    *
    *  @brief Assert if the predicate fails and use a subset of the supplied message.
    *
    *  Example:
    *
    *  @code
    *  const char* msg = "a does not equal b b does not equal a";
    *  arisen::check(a == b, "a does not equal b", 18);
    *  @endcode
    */
   inline void check(bool pred, const char* msg, size_t n) {
      if (!pred) {
         arisen_assert_message(false, msg, n);
      }
   }

   /**
    *
    *  @brief Assert if the predicate fails and use a subset of the supplied message.
    *
    *  Example:
    *
    *  @code
    *  std::string msg = "a does not equal b b does not equal a";
    *  arisen::check(a == b, msg, 18);
    *  @endcode
    */
   inline void check(bool pred, const std::string& msg, size_t n) {
      if (!pred) {
         arisen_assert_message(false, msg.c_str(), n);
      }
   }

    /**
    *
    *  @brief Assert if the predicate fails and use the supplied error code.
    *
    *  Example:
    *
    *  @code
    *  arisen::check(a == b, 13);
    *  @endcode
    */
   inline void check(bool pred, uint64_t code) {
      if (!pred) {
         arisen_assert_code(false, code);
      }
   }
} // namespace arisen
   /// @}
