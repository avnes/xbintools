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

param=$1

docker_ps_count=$(docker ps --no-trunc -aqf "status=exited" | wc -l)
docker_img_count=$(docker images --no-trunc -aqf "dangling=true" | wc -l)

show_help() {
	echo ""
	echo "Info:    dockerclean is used to remove dangling images and cleanup"
	echo "Usage:   dockerclean.sh"
	echo ""
}

kill_docker() {
	if [ -n "$param" ]; then
		show_help
	else
		if [ ${docker_ps_count} -gt 0  ]; then
			echo "Count is: ${docker_ps_count}"
			docker ps --no-trunc -aqf "status=exited" | xargs docker rm
		else
			echo "No instances found"
		fi
		if [ ${docker_img_count} -gt 0  ]; then
			docker images --no-trunc -aqf "dangling=true" | xargs docker rmi --force
		else
			echo "No dangling images found"
		fi
	fi
}

kill_docker