#! /bin/sh -e
rm -rf autom4te.cache
aclocal -I m4
autoheader
if type libtoolize > /dev/null 2>&1; then
  libtoolize --copy
elif type glibtoolize > /dev/null 2>&1; then
  glibtoolize --copy
else
  echo "ERROR: Could not find either libtoolize or glibtoolize" >&2;
  exit 1;
fi
automake --add-missing --copy
autoconf
