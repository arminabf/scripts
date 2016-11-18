#!/bin/bash

qrencode --output=qr.png
qiv -f -o \#ffffff -W 200 qr.png
rm qr.png
