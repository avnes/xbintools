#!/bin/bash
#
# https://github.com/avnes/xbintools
#
# MIT License
#
# Copyright (c) 2017 Audun V. Nes
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

pattern=$1

show_help() {
	echo ""
	echo "Info:    killpal is used to kill running processes based on input pattern"
	echo "Usage:   killpal.sh pattern"
	echo "Example: killpal.sh chromium-browser"
	echo ""
}

kill_pid() {
	if [ -n "$pattern" ]; then
		echo "Input pattern is ${pattern}"
		ps -ef | grep ${pattern} | grep -v "killpal.sh" | grep -v grep | sed "s/  */ /g" | cut -d ' ' -f2 | while read pid; do
			echo "Killing process with PID $pid";
			kill $pid
		done
	else
		show_help
	fi
}

kill_pid
