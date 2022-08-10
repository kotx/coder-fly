#!/bin/sh
CODER_PG_CONNECTION_URL="${DATABASE_URL}?sslmode=disable" /opt/coder server
