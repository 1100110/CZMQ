/*  =========================================================================
    zsockopt - get/set 0MQ socket options

    GENERATED SOURCE CODE, DO NOT EDIT
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
module zsockopt;

import zmq;

extern (C)
{

///  @interface
//TODO make sure that this works....
static if(ZMQ_VERSION_MAJOR == 2)
{
    ///  Get socket options
    int  zsocket_hwm(void* socket);
    int  zsocket_swap (void* socket);
    int  zsocket_affinity (void* socket);
    int  zsocket_rate (void* socket);
    int  zsocket_recovery_ivl (void* socket);
    int  zsocket_recovery_ivl_msec (void* socket);
    int  zsocket_mcast_loop (void* socket);
    int  zsocket_sndbuf (void* socket);
    int  zsocket_rcvbuf (void* socket);
    int  zsocket_linger (void* socket);
    int  zsocket_reconnect_ivl (void* socket);
    int  zsocket_reconnect_ivl_max (void* socket);
    int  zsocket_backlog (void* socket);
    int  zsocket_type (void* socket);
    int  zsocket_rcvmore (void* socket);
    int  zsocket_fd (void* socket);
    int  zsocket_events (void* socket);

    ///  Set socket options
    void zsocket_set_hwm (void* socket, int hwm);
    void zsocket_set_swap (void* socket, int swap);
    void zsocket_set_affinity (void* socket, int affinity);
    void zsocket_set_identity (void* socket, in char* identity);
    void zsocket_set_rate (void* socket, int rate);
    void zsocket_set_recovery_ivl (void* socket, int recovery_ivl);
    void zsocket_set_recovery_ivl_msec (void* socket, int recovery_ivl_msec);
    void zsocket_set_mcast_loop (void* socket, int mcast_loop);
    void zsocket_set_sndbuf (void* socket, int sndbuf);
    void zsocket_set_rcvbuf (void* socket, int rcvbuf);
    void zsocket_set_linger (void* socket, int linger);
    void zsocket_set_reconnect_ivl (void* socket, int reconnect_ivl);
    void zsocket_set_reconnect_ivl_max (void* socket, int reconnect_ivl_max);
    void zsocket_set_backlog (void* socket, int backlog);
    void zsocket_set_subscribe (void* socket, in char* subscribe);
    void zsocket_set_unsubscribe (void* socket, in char* unsubscribe);
}

static if(ZMQ_VERSION_MAJOR == 3)
{
    ///  Get socket options
    int  zsocket_sndhwm (void* socket);
    int  zsocket_rcvhwm (void* socket);
    int  zsocket_affinity (void* socket);
    int  zsocket_rate (void* socket);
    int  zsocket_recovery_ivl (void* socket);
    int  zsocket_sndbuf (void* socket);
    int  zsocket_rcvbuf (void* socket);
    int  zsocket_linger (void* socket);
    int  zsocket_reconnect_ivl (void* socket);
    int  zsocket_reconnect_ivl_max (void* socket);
    int  zsocket_backlog (void* socket);
    int  zsocket_maxmsgsize (void* socket);
    int  zsocket_type (void* socket);
    int  zsocket_rcvmore (void* socket);
    int  zsocket_fd (void* socket);
    int  zsocket_events (void* socket);

    ///  Set socket options
    void zsocket_set_sndhwm (void* socket, int sndhwm);
    void zsocket_set_rcvhwm (void* socket, int rcvhwm);
    void zsocket_set_affinity (void* socket, int affinity);
    void zsocket_set_identity (void* socket, in char* identity);
    void zsocket_set_rate (void* socket, int rate);
    void zsocket_set_recovery_ivl (void* socket, int recovery_ivl);
    void zsocket_set_sndbuf (void* socket, int sndbuf);
    void zsocket_set_rcvbuf (void* socket, int rcvbuf);
    void zsocket_set_linger (void* socket, int linger);
    void zsocket_set_reconnect_ivl (void* socket, int reconnect_ivl);
    void zsocket_set_reconnect_ivl_max (void* socket, int reconnect_ivl_max);
    void zsocket_set_backlog (void* socket, int backlog);
    void zsocket_set_maxmsgsize (void* socket, int maxmsgsize);
    void zsocket_set_subscribe (void* socket, in char* subscribe);
    void zsocket_set_unsubscribe (void* socket, in char* unsubscribe);

    ///  Emulation of widely-used 2.x socket options
    void zsocket_set_hwm (void* socket, int hwm);
}

static if(ZMQ_VERSION_MAJOR == 4)
{
    ///  Get socket options
    int  zsocket_sndhwm (void* socket);
    int  zsocket_rcvhwm (void* socket);
    int  zsocket_affinity (void* socket);
    int  zsocket_rate (void* socket);
    int  zsocket_recovery_ivl (void* socket);
    int  zsocket_sndbuf (void* socket);
    int  zsocket_rcvbuf (void* socket);
    int  zsocket_linger (void* socket);
    int  zsocket_reconnect_ivl (void* socket);
    int  zsocket_reconnect_ivl_max (void* socket);
    int  zsocket_backlog (void* socket);
    int  zsocket_maxmsgsize (void* socket);
    int  zsocket_type (void* socket);
    int  zsocket_rcvmore (void* socket);
    int  zsocket_fd (void* socket);
    int  zsocket_events (void* socket);

    ///  Set socket options
    void zsocket_set_sndhwm (void* socket, int sndhwm);
    void zsocket_set_rcvhwm (void* socket, int rcvhwm);
    void zsocket_set_affinity (void* socket, int affinity);
    void zsocket_set_rate (void* socket, int rate);
    void zsocket_set_recovery_ivl (void* socket, int recovery_ivl);
    void zsocket_set_sndbuf (void* socket, int sndbuf);
    void zsocket_set_rcvbuf (void* socket, int rcvbuf);
    void zsocket_set_linger (void* socket, int linger);
    void zsocket_set_reconnect_ivl (void* socket, int reconnect_ivl);
    void zsocket_set_reconnect_ivl_max (void* socket, int reconnect_ivl_max);
    void zsocket_set_backlog (void* socket, int backlog);
    void zsocket_set_maxmsgsize (void* socket, int maxmsgsize);
    void zsocket_set_subscribe (void* socket, in char* subscribe);
    void zsocket_set_unsubscribe(void* socket, in char* unsubscribe);

    ///  Emulation of widely-used 2.x socket options
    void zsocket_set_hwm (void* socket, int hwm);
}

///  Self test of this class
int zsocket_test(bool verbose);
///  @end

}
