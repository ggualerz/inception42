include ./srcs/.env
export

all:
	echo "\tAdd FDQN in hostfile\n"
	sudo echo "127.0.0.1 $(FDQN)" >> /etc/hosts
	sudo echo "127.0.0.1 www.$(FDQN)" >> /etc/hosts
	echo "\n\n\n\tDocker compose build and up\n"
	mkdir -p $(VOLUME_ROOT)
	chmod 777 $(VOLUME_ROOT)
	cd srcs && sudo docker compose build && sudo docker compose up -d

clean:
	echo "\n\n\n\tDocker compose down, it will not clean persistent data\n"
	cd srcs && sudo docker-compose down

fclean:
	make clean
	echo "\n\n\n\tRemoving persistant storage\n"
	sudo docker system prune --all
	sudo rm -rf $(VOLUME_ROOT)

re:
	make fclean
	make all

