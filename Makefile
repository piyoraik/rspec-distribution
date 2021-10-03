RIMAGE 	 := raityupiyo/rspec
RVERSION := v1.1
DIMAGE 	 := raityupiyo/rails
DVERSION := v1.0
DNAME		 := debug_rails
HOSTPORT := 3000

help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"

up:
	@docker run --rm -d --name ${DNAME} -p ${HOSTPORT}:3000 ${DIMAGE}:${DVERSION} ${github}
	@docker run --rm -t ${RIMAGE}:${RVERSION} ${github} 

exec:
	@docker exec -it ${DNAME} bash

down:
	@docker rm -f ${DNAME}

alldown:
	@docker rm -f `docker ps -a -q`