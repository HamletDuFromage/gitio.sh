#/bin/sh

usage(){
    echo "Usage: gitio.sh -u <github url> -c <gitio code>"
    exit 1
}

while getopts ":u:c:" o; do
    case "${o}" in
        u)
            url=${OPTARG}
            ;;
        c)
            code=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${url}" ] || [ -z "${code}" ]; then
    usage
fi

curl -i https://git.io -s -F "url=${url}" -F "code=${code}" | grep "Location:" 
