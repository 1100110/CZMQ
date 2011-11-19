//Extremely simple test to ensure everything is working properly

import std.stdio;
import zclock;

void main()
{
    auto start = zclock_time();
    zclock_sleep(10);
    assert((zclock_time() - start) >= 10);
    writeln("test_zclock passes");
}
