#!/bin/bash

git clone https://github.com/coreruleset/coreruleset 

mv coreruleset/rules/*.data /coraza/crs/
cat crs_setup.conf coreruleset/rules/*.conf > /coraza/crs/custom-crs.conf   