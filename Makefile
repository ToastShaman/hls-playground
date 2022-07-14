PWD = $(shell pwd)

serve: encode
	docker run --rm -it -p 8080:80 -v $(PWD):/usr/share/nginx/html nginx
.PHONY: serve

encode:
	docker run --rm -it \
	-v $(PWD):/config \
  	linuxserver/ffmpeg \
  	-i /config/file_example_MP4_1920_18MG.mp4 \
  	-codec: copy \
  	-start_number 0 \
  	-hls_time 10 \
  	-hls_list_size 0 \
	-f hls \
  	/config/file_example_MP4_1920_18MG.m3u8
.PHONY: encode
