//Builds, but never recieves END.
//Infinite loop


import std.stdio;
import czmq;

int main(char[][] args)
{
    zctx_t* ctx = zctx_new ();

    void *output = zsocket_new (ctx, ZMQ_PAIR);
    zsocket_bind (output, "inproc://zstr.test".ptr);
    void *input = zsocket_new (ctx, ZMQ_PAIR);
    zsocket_connect (input, "inproc://zstr.test".ptr);

    //  Send ten strings and then END
    foreach(string_nbr; 0..10)
        zstr_sendf (output, "this is string %d".ptr, string_nbr);
    zstr_send (output, "END".ptr);

    //  Read and count until we receive END
    int string_nbr = 0;
    for (string_nbr = 0;; string_nbr++) {
        char *string = zstr_recv (input);
        if ((string == "END")) {
            break;
        }
    }
    assert (string_nbr == 10);
    writeln("test_zstr passes");
    zctx_destroy (&ctx);
    return 0;
}

