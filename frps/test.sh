function __readToml() {
 TOMFILE=$1; SECTION=$2; ITEM=$3
 if [ -z "${SECTION}" ]; then
    _readIni=`awk -F '=' '/'$ITEM'/{print $2;exit}' $TOMFILE`
 else
    _readIni=`awk -F '=' '/\['$SECTION'\]/{a=1}a==1&&$1~/'$ITEM'/{print $2;exit}' $TOMFILE`
 fi
echo ${_readIni}
}

def_kcp_bind_port=( $( __readToml './frps_full_example.toml' '' bindPort ) )

echo $def_kcp_bind_port

def_kcp_bind_port2=( $( __readToml './frps_full_example.toml' 'httpPlugins' addr ) )

echo $def_kcp_bind_port2