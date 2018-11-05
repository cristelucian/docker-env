#!/bin/sh
docker build  --no-cache  -t llucas/gih_eng:latest  .
docker push llucas/gih_eng:latest
