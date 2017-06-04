#!/usr/bin/bash
# only argument is the file to check

# aspell for HTML
aspell -H -c $1


# Check HTML
tidy $1 1> /dev/null
