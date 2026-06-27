#!/bin/bash
git tag -a $1 -m "latest tag"
git push origin --tags
