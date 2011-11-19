import std.stdio;
import czmq;

void main(string[] args)
{
    auto ctx = zctx_new();

    //  Create a detached thread, let it run
    auto interf = "*".ptr;
    auto domain = ("localhost").ptr;
    int service = 5560;

    void* writer = zsocket_new(ctx, ZMQ_PUSH);
    void* reader = zsocket_new(ctx, ZMQ_PULL);
    assert((zsocket_type_str (writer) == "PUSH"));
    assert((zsocket_type_str (reader) == "PULL"));
    int rc = zsocket_bind (writer, "tcp://%s:%d", interf, service);
    assert(rc == service);
    zsocket_connect(reader, "tcp://%s:%d", domain, service);
    zstr_send(writer, "HELLO");
    char* message = zstr_recv(reader);
    assert(message);
    assert(message == "HELLO");
    //free(message);

    int port = zsocket_bind (writer, "tcp://%s:*", interf);
    assert(port >= ZSOCKET_DYNFROM && port <= ZSOCKET_DYNTO);

    zsocket_destroy(ctx, writer);
    zctx_destroy(&ctx);
    writeln("test_zsocket passes");

}
