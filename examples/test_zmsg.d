

import std.stdio: writeln;
import std.c.stdio;
import czmq;

int main(char[][] args)
{
    zctx_t *ctx = zctx_new ();

    void *output = zsocket_new (ctx, ZMQ_PAIR);
    zsocket_bind (output, "inproc://zmsg.test".ptr);
    void *input = zsocket_new (ctx, ZMQ_PAIR);
    zsocket_connect (input, "inproc://zmsg.test".ptr);

    //  Test send and receive of single-frame message
    zmsg_t *msg = zmsg_new ();
    zframe_t *frame = zframe_new ("Hello".ptr, 5);
    zmsg_push (msg, frame);
    assert (zmsg_size (msg) == 1);
    assert (zmsg_content_size (msg) == 5);
    zmsg_send (&msg, output);
    assert (msg == null);

    msg = zmsg_recv (input);
    assert (msg);
    assert (zmsg_size (msg) == 1);
    assert (zmsg_content_size (msg) == 5);
    zmsg_destroy (&msg);

    //  Test send and receive of multi-frame message
    msg = zmsg_new ();
    zmsg_addmem (msg, "Frame0".ptr, 6);
    zmsg_addmem (msg, "Frame1".ptr, 6);
    zmsg_addmem (msg, "Frame2".ptr, 6);
    zmsg_addmem (msg, "Frame3".ptr, 6);
    zmsg_addmem (msg, "Frame4".ptr, 6);
    zmsg_addmem (msg, "Frame5".ptr, 6);
    zmsg_addmem (msg, "Frame6".ptr, 6);
    zmsg_addmem (msg, "Frame7".ptr, 6);
    zmsg_addmem (msg, "Frame8".ptr, 6);
    zmsg_addmem (msg, "Frame9".ptr, 6);
    zmsg_t *copy = zmsg_dup (msg);
    zmsg_send (&copy, output);
    zmsg_send (&msg, output);

    copy = zmsg_recv (input);
    assert (copy);
    assert (zmsg_size (copy) == 10);
    assert (zmsg_content_size (copy) == 60);
    zmsg_destroy (&copy);

    msg = zmsg_recv (input);
    assert (msg);
    assert (zmsg_size (msg) == 10);
    assert (zmsg_content_size (msg) == 60);
    if (verbose)
        zmsg_dump (msg);

    //  Save to a file, read back
    FILE *file = fopen ("zmsg.test", "w");
    assert (file);
    int rc = zmsg_save (msg, file);
    assert (rc == 0);
    fclose (file);

    file = fopen ("zmsg.test", "r");
    rc = zmsg_save (msg, file);
    assert (rc == -1);
    fclose (file);
    zmsg_destroy (&msg);

    file = fopen ("zmsg.test", "r");
    msg = zmsg_load (null, file);
    fclose (file);
    remove ("zmsg.test");
    assert (zmsg_size (msg) == 10);
    assert (zmsg_content_size (msg) == 60);

    //  Remove all frames except first and last
    int frame_nbr;
    for (frame_nbr = 0; frame_nbr < 8; frame_nbr++) {
        zmsg_first (msg);
        frame = zmsg_next (msg);
        zmsg_remove (msg, frame);
        zframe_destroy (&frame);
    }
    //  Test message frame manipulation
    assert (zmsg_size (msg) == 2);
    assert (zmsg_content_size (msg) == 12);
    frame = zframe_new ("Address".ptr, 7);
    zmsg_wrap (msg, frame);
    assert (zmsg_size (msg) == 4);
    zmsg_addstr (msg, "Body");
    assert (zmsg_size (msg) == 5);
    frame = zmsg_unwrap (msg);
    zframe_destroy (&frame);
    assert (zmsg_size (msg) == 3);
    char* bdy = zmsg_popstr (msg);
    writeln(bdy);
    assert (bdy, "F".ptr);
    //free (bdy);
    zmsg_destroy (&msg);
    return 0;
}

