#!/bin/bash

update(){
sudo pv  apt -y update 2>/dev/null | grep packages |cut -d '-' -f 1
sudo apt -y upgrade 2>/dev/null | grep packages |cut -d '-' -f 1
sudo apt -y full-upgrade 2>/dev/null | grep packages |cut -d '-' -f 1
sudo apt -y autoremove 2>/dev/null | grep packages |cut -d '-' -f 1
sudo apt -y purge 2>/dev/null | grep packages |cut -d '-' -f 1
}


sudo ufu allow 8069/tcp
sudo ufu allow
sudo ufu reload
echo -e "\e[32m#############################

 _____ ______     _    _______        _       _           _____  _____    _____   _____  

(_____)  ___ \   | |  (_______)  /\  | |     | |         / ___ \(____ \  / ___ \ / ___ \ 

   _  | |   | |   \ \  _        /  \ | |     | |        | |   | |_   \ \| |   | | |   | |

  | | | |   | |    \ \| |      / /\ \| |     | |        | |   | | |   | | |   | | |   | |

 _| |_| |   | |_____) ) |_____| |__| | |_____| |_____   | |___| | |__/ /| |___| | |___| |

(_____)_|   |_(______/ \______)______|_______)_______)  \_____/|_____/  \_____/ \_____/ 

                                                                                         

                                                                                      
#############################\e[0m
"

echo -e "\e[32m#############################

# UPADATE REPOS         #

#############################\e[0m"


update

echo -e "\e[32m#############################

# UPDATE DONE         #

#############################\e[0m"





echo -e "\e[32m#############################
#   INSTALL POSTGRESQL      #
#############################\e[0m"

sudo apt install postgresql postgresql-client 2>/dev/null | grep packages |cut -d '-' -f 1


echo -e "\e[32m#############################
#  INSTALLATION COMPLETED      #
############################\e[0m"





echo -e "\e[32m#############################
#  UPDATING REPSOSITORIES      #
#############################\e[0m"

wget -O - https://nightly.odoo.com/odoo.key | sudo apt-key add -  2>/dev/null
echo "deb http://nightly.odoo.com/15.0/nightly/deb/ ./" >  /etc/apt/sources.list.d/odoo.list  2>/dev/null



echo -e "\e[32m#############################
#  REPSOITORIES ADDED      #
#############################\e[0m"

echo -e "\e[32m#############################
#  INSTALLING ODOO       #
#############################\e[0m"

update
sudo apt install odoo 2>/dev/null | grep packages |cut -d '-' -f 1
echo -e "\e[32m#############################

#  ODOO INSTLATION COMPLETED SUCCESFULLY      #

#############################\e[0m"



echo -e "\e[32m#############################

#  CREATE DB       #

#############################\e[0m

"

sudo -u postgres createuser -s $USER 2>/dev/null

sudo createdb $USER 2>/dev/null



echo -e "\e[32m#############################

#     DB CREATED        #

#############################\e[0m"







echo -e "\e[32m#############################

# STARTING SERVICES       #

#############################\e[0m

"





sudo systemctl restart postgresql 2>/dev/null

sudo systemctl restart odoo 2>/dev/null





echo -e "\e[32m#############################
#    ALL DONE ACCESSSERVER BY http://127.0.0.1:8069     #

#############################\e[0m"
