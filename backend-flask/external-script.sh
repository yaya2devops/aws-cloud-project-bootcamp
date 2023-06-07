#!/bin/bash
python3 -m flask run --host=0.0.0.0 --port=${PORT:-4567} --debug