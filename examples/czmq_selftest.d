/*  =========================================================================
    czmq_tests.c - run selftests

    Runs all selftests.

    -------------------------------------------------------------------------
    Copyright (c) 1991-2011 iMatix Corporation <www.imatix.com>
    Copyright other contributors as noted in the AUTHORS file.

    This file is part of czmq, the high-level C binding for 0MQ:
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

import std.getopt;
import std.stdio;

import czmq_prelude;
import zclock;
import zctx;
import zfile;
import zframe;
import zhash;
import zlist;
import zloop;
import zmsg;
import zsocket;
import zsockopt;
import zstr;
import zthread;

bool verbose;

int main(string[] args)
{
    getopt(args, "verbose", &verbose);

    writeln("Running czmq self tests...");

    zclock_test(verbose);
    zctx_test(verbose);
    zfile_test(verbose);
    zframe_test(verbose);
    zhash_test(verbose);
    zlist_test(verbose);
    zloop_test(verbose);
    zmsg_test(verbose);
    zsocket_test(verbose);
    zsockopt_test(verbose);
    zstr_test(verbose);
    zthread_test(verbose);

    writeln("Tests passed OK");
    return 0;
}
