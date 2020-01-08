#!/bin/bash
set -ex

cd /work/tests

../output/entrypoint_amd64 --default_variables `pwd`/defaults.yml --variables `pwd`/variables.yml --templates `pwd`/templates --scripts `pwd`/scripts -- echo 'cmdline test' >> /tmp/cmdline

sha256sum -c test.sums

