/**
 *  @file
 *  @copyright defined in rsn/LICENSE
 */
#pragma once
#include "../../core/arisen/time.hpp"
#include "../../core/arisen/check.hpp"

namespace arisen {
  namespace internal_use_do_not_use {
    extern "C" {
      __attribute__((arisen_wasm_import, noreturn))
      void arisen_exit( int32_t code );
    }
  }

  /**
   *  @addtogroup system System
   *  @ingroup contracts
   *  @brief Defines time related functions and arisen_exit
   */

   /**
    *  This method will abort execution of wasm without failing the contract. This is used to bypass all cleanup / destructors that would normally be called.
    *
    *  @ingroup system
    *  @param code - the exit code
    *  Example:
    *
    *  @code
    *  arisen_exit(0);
    *  arisen_exit(1);
    *  arisen_exit(2);
    *  arisen_exit(3);
    *  @endcode
    */
   inline void arisen_exit( int32_t code ) {
     internal_use_do_not_use::arisen_exit(code);
   }

   /**
   *  Returns the time in microseconds from 1970 of the current block as a time_point
   *
   *  @ingroup system
   *  @return time in microseconds from 1970 of the current block as a time_point
   */
   time_point current_time_point();

   /**
   *  Returns the time in microseconds from 1970 of the current block as a block_timestamp
   *
   *  @ingroup system
   *  @return time in microseconds from 1970 of the current block as a block_timestamp
   */
   block_timestamp current_block_time();
}
