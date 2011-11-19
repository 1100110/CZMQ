

import std.stdio;
import czmq;

int main(char[][] args)
{
    zctx_t *ctx = zctx_new ();

    void *output = zsocket_new (ctx, ZMQ_PAIR);
    zsocket_bind (output, "inproc://zframe.test");
    void *input = zsocket_new (ctx, ZMQ_PAIR);
    zsocket_connect (input, "inproc://zframe.test");

    //  Send five different frames, test ZFRAME_MORE
    int frame_nbr;
    for (frame_nbr = 0; frame_nbr < 5; frame_nbr++) {
        zframe_t *frame = zframe_new ("Hello".ptr, 5);
        zframe_send (&frame, output, ZFRAME_MORE);
    }
    //  Send same frame five times, test ZFRAME_REUSE
    zframe_t* frame = zframe_new ("Hello".ptr, 5);
    for (frame_nbr = 0; frame_nbr < 5; frame_nbr++) {
        zframe_send (&frame, output, ZFRAME_MORE + ZFRAME_REUSE);
    }
    assert (frame);
    zframe_t *copy = zframe_dup (frame);
    assert (zframe_eq (frame, copy));
    zframe_destroy (&frame);
    assert (!zframe_eq (frame, copy));
    assert (zframe_size (copy) == 5);
    zframe_destroy (&copy);
    assert (!zframe_eq (frame, copy));

    //  Send END frame
    frame = zframe_new ("NOT".ptr, 3);
    zframe_reset (frame, "END".ptr, 3);
    auto str = zframe_strhex (frame);
    writeln(*str);
    //This only checks the first character in the char...
    //TODO need to figure out a way to read to the end o
    assert (*str == '4');
    str = zframe_strdup (frame);
    writeln(*str);
    //assert failed
    //Ditto
    assert(*str == 'E');
    //free (string);
    zframe_send (&frame, output, 0);

    //  Read and count until we receive END
    frame_nbr = 0;
    for (frame_nbr = 0;; frame_nbr++) {
        zframe_t *frame2 = zframe_recv (input);
        if (zframe_streq (frame2, "END")) {
            zframe_destroy (&frame2);
            break;
        }
        assert (zframe_more (frame2));
        zframe_destroy (&frame2);
    }
    assert (frame_nbr == 10);
    frame = zframe_recv_nowait (input);
    assert (frame == null);

    zctx_destroy (&ctx);
    writeln("test_zframe passes");
    return 0;
}

