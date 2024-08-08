#/bin/sh

bin_folder=_utils/bin

world_bin=WorldServer
zone_bin=ZoneServer

gateway_fb=GatewayServer
login_fb=LoginServer
mission_fb=MissionServer
ticket_fb=TicketServer
world101_fb=WorldServer101
world102_fb=WorldServer102
world109_fb=WorldServer109
zone101_fb=ZoneServer101
zone102_fb=ZoneServer102
zone109_fb=ZoneServer109

gateway_offset=16AE07
login_local_offset=14D1FA
login_offset=152007
mission_offset=4AEA27
ticket_offset=11B74B
world_local_offset=38A7BB
world_offset=3E2C27
zone_offset=81BD07

hex_ip=""
hex_ip_local=""

ip_parts=(${HOST_IP//./ })
ip_parts[3]=0
server_ip="${ip_parts[0]}.${ip_parts[1]}.${ip_parts[2]}.${ip_parts[3]}"
server_ip_local="${ip_parts[0]}.${ip_parts[1]}."

for char in $(echo "$server_ip" | grep -o .); do
    hex_ip+=$(printf '%02x' "'$char")
done

while [ ${#hex_ip} -lt 30 ]; do
    hex_ip+="00"
done

for char in $(echo "$server_ip_local" | grep -o .); do
    hex_ip_local+=$(printf '%02x' "'$char")
done

while [ ${#hex_ip_local} -lt 16 ]; do
    hex_ip_local+="00"
done

ip_bytes=$(echo $hex_ip | sed 's/\(..\)/\\\x\1/g')
ip_local_bytes=$(echo $hex_ip_local | sed 's/\(..\)/\\\x\1/g')

echo -en $ip_bytes | dd of=${gateway_fb}/${gateway_fb} bs=1 seek=$((0x$gateway_offset)) count=${#ip_bytes} conv=notrunc >/dev/null 2>&1
echo -en $ip_bytes | dd of=${login_fb}/${login_fb} bs=1 seek=$((0x$login_offset)) count=${#ip_bytes} conv=notrunc >/dev/null 2>&1
echo -en $ip_bytes | dd of=${mission_fb}/${mission_fb} bs=1 seek=$((0x$mission_offset)) count=${#ip_bytes} conv=notrunc >/dev/null 2>&1
echo -en $ip_bytes | dd of=${ticket_fb}/${ticket_fb} bs=1 seek=$((0x$ticket_offset)) count=${#ip_bytes} conv=notrunc >/dev/null 2>&1
echo -en $ip_bytes | dd of=${bin_folder}/${world_bin} bs=1 seek=$((0x$world_offset)) count=${#ip_bytes} conv=notrunc >/dev/null 2>&1
echo -en $ip_bytes | dd of=${bin_folder}/${zone_bin} bs=1 seek=$((0x$zone_offset)) count=${#ip_bytes} conv=notrunc >/dev/null 2>&1

cp -f ${bin_folder}/${world_bin} ${world101_fb}/${world101_fb}
cp -f ${bin_folder}/${world_bin} ${world102_fb}/${world102_fb}
cp -f ${bin_folder}/${world_bin} ${world109_fb}/${world109_fb}
cp -f ${bin_folder}/${zone_bin} ${zone101_fb}/${zone101_fb}
cp -f ${bin_folder}/${zone_bin} ${zone102_fb}/${zone102_fb}
cp -f ${bin_folder}/${zone_bin} ${zone109_fb}/${zone109_fb}

sed -i "/GameDBPassword/c\GameDBPassword=$PG_PASSWORD" "./setup.ini"
sed -i "/AccountDBPW/c\AccountDBPW=$PG_PASSWORD" "./setup.ini"
sed -i "/AccountDBPW/c\AccountDBPW=$PG_PASSWORD" "./GatewayServer/setup.ini"

POSTGRESQLVERSION=$(psql --version | cut -c 19-20)

cd "/etc/postgresql/$POSTGRESQLVERSION/main"
sed -i "s/#logging_collector = off/logging_collector = on/g" postgresql.conf
sed -i "s/#log_directory = 'log'/log_directory = 'pg_log'/g" postgresql.conf
sed -i "s/#log_destination = 'stderr'/log_destination = 'csvlog'/g" postgresql.conf
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" postgresql.conf
sed -i "s+host    all             all             127.0.0.1/32            md5+host    all             all             0.0.0.0/0            md5+g" pg_hba.conf
sed -i "s/local   all             postgres                                peer/local   all             postgres                                md5/g" pg_hba.conf
sed -i "s/local   all             all                                     peer/local   all             all                                     md5/g" pg_hba.conf

sudo -u postgres psql -c "ALTER user postgres WITH password '$PG_PASSWORD';"

# sed -i "/server_host =/c\    \$server_host = '$HOST_IP';" "/var/www/html/config.php"
# sed -i "/db_password =/c\    \$db_password = '$PG_PASSWORD';" "/var/www/html/config.php"

psql -U postgres -c "create database gf_gs encoding 'UTF8' template template0;"
psql -U postgres -c "create database gf_ls encoding 'UTF8' template template0;"
psql -U postgres -c "create database gf_ms encoding 'UTF8' template template0;"

psql -U postgres -d gf_gs -c "\i '/root/gf_server/_utils/db/gf_gs.sql';"
psql -U postgres -d gf_ls -c "\i '/root/gf_server/_utils/db/gf_ls.sql';"
psql -U postgres -d gf_ms -c "\i '/root/gf_server/_utils/db/gf_ms.sql';"

psql -U postgres -d gf_ls -c "UPDATE worlds SET ip = '$HOST_IP';"
psql -U postgres -d gf_gs -c "UPDATE serverstatus SET int_address = '$HOST_IP';"
psql -U postgres -d gf_gs -c "UPDATE serverstatus SET ext_address = '$HOST_IP' WHERE ext_address != 'none';"