/*  =========================================================================
    czmq_prelude.h - CZMQ environment

    -------------------------------------------------------------------------
    Copyright (c) 1991-2011 iMatix Corporation <www.imatix.com>
    Copyright other contributors as noted in the AUTHORS file.

    This file is part of CZMQ, the high-level C binding for 0MQ:
    http://czmq.zeromq.org.

    This is free software; you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation; either version 3 of the License, or (at
    your option) any later version.

    This software is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this program. If not, see
    <http://www.gnu.org/licenses/>.
    =========================================================================
*/
module czmq_prelude;

///- Always include ZeroMQ header file ---------------------------------------
public import zmq;



///- Standard ANSI include files ---------------------------------------------


///- System-specific include files -------------------------------------------


///- Check compiler data type sizes ------------------------------------------

///TODO are these even used anywhere??
///- Data types --------------------------------------------------------------

///typedef          int    Bool;           //  Boolean TRUE/FALSE value
///typedef unsigned char   byte;           //  Single unsigned byte = 8 bits
///typedef unsigned short  dbyte;          //  Double byte = 16 bits
///typedef unsigned int    qbyte;          //  Quad byte = 32 bits
alias ushort dbyte;
alias uint qbyte;

///- Inevitable macros -------------------------------------------------------


///- A number of POSIX and C99 keywords and data types -----------------------


///- Error reporting ---------------------------------------------------------
/// If the compiler is GCC or supports C99, include enclosing function
/// in czmq assertions


///  Replacement for malloc() which asserts if we run out of heap, and
///  which zeroes the allocated block.


///  Define _ZMALLOC_DEBUG if you need to trace memory leaks using e.g. mtrace,
///  otherwise all allocations will claim to come from zfl_prelude.h.  For best
///  results, compile all classes so you see dangling object allocations.
///  _ZMALLOC_PEDANTIC does the same thing, but its intention is to propagate
///  out of memory condition back up the call stack.


///- DLL exports -------------------------------------------------------------
