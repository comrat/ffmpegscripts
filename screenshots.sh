#!/bin/bash

ffmpeg -i $1 -vf fps=1/$2 out%d.png
