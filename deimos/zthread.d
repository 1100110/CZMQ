/*  =========================================================================
    zthread - working with system threads

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
module zthread;

public import zctx;

extern (C)
{

///  @interface
///  Detached threads follow POSIX pthreads API
///typedef void* (zthread_detached_fn) (void* args);
alias void* function(void* args) zthread_detached_fn;

///  Attached threads get context and pipe from parent
///typedef void (zthread_attached_fn) (void* args, zctx_t* ctx, void* pipe);
alias void function(void* args, zctx_t* ctx, void* pipe) zthread_attached_fn;

///  Create a detached thread. A detached thread operates autonomously
///  and is used to simulate a separate process. It gets no ctx, and no
///  pipe.
int zthread_new(zthread_detached_fn* thread_fn, void* args);

///  Create an attached thread. An attached thread gets a ctx and a PAIR
///  pipe back to its parent. It must monitor its pipe, and exit if the
///  pipe becomes unreadable.
void* zthread_fork(zctx_t* ctx, zthread_attached_fn* thread_fn, void* args);

///  Self test of this class
int zthread_test(bool verbose);
///  @end

}
