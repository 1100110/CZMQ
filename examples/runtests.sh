#!/usr/bin/env sh

echo "Starting all tests..."
echo "&&&&&&&&&&&&&&&&&&&"
echo ""
./test_zstr     &&
./test_zsockopt &&
./test_zsocket  &&
./test_zclock   &&
./test_zctx     &&
./czmq_selftest
