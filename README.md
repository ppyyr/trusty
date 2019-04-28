# trusty(ubuntu 14.04)

For build Android

Init: You should have mtk toolchains, then extract toolchains to mtkoss and mtkeda

Usage: docker run -it --rm -v $(pwd):$(pwd) -v /mtkoss:/mtkoss -v /mtkeda:/mtkeda kanako/trusty bash
