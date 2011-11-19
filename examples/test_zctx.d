


import std.stdio;
import zmq;
import czmq;

int main(char[][] args)
{
//  Create and destroy a context without using it
    zctx_t* ctx = zctx_new();
    assert(ctx);
    zctx_destroy(&ctx);
    assert(ctx == null);

    //  Create a context with many busy sockets, destroy it
    auto ctx2 = zctx_new();
    zctx_set_iothreads(ctx2, 1);
    zctx_set_linger(ctx2, 5);       //  5 msecs
    void* s1 = zctx__socket_new(ctx2, ZMQ_PAIR);
    void* s2 = zctx__socket_new(ctx2, ZMQ_XREQ);
    void* s3 = zctx__socket_new(ctx2, ZMQ_REQ);
    void* s4 = zctx__socket_new(ctx2, ZMQ_REP);
    void* s5 = zctx__socket_new(ctx2, ZMQ_PUB);
    void* s6 = zctx__socket_new(ctx2, ZMQ_SUB);
    zsocket_connect(s1, "tcp://127.0.0.1:5555");
    zsocket_connect(s2, "tcp://127.0.0.1:5555");
    zsocket_connect(s3, "tcp://127.0.0.1:5555");
    zsocket_connect(s4, "tcp://127.0.0.1:5555");
    zsocket_connect(s5, "tcp://127.0.0.1:5555");
    zsocket_connect(s6, "tcp://127.0.0.1:5555");

    //  Everything should be cleanly closed now
    zctx_destroy(&ctx);
    assert(ctx2 == null);
    writeln("test_zctx passes");
    return 0;
}

