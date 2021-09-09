sudo docker build -t woffee/joern:v1 .

sudo docker run -it -v /home/wf/www/test_docker/joern:/data woffee/joern sh

/opt/joern/joern-parse /data/demo.c --out /data/cpg.bin.zip

cd /opt/joern && ./joern --script joern_cfg_to_dot.sc --params cpgFile=/data/cpg.bin.zip
