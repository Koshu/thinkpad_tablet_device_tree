for i in `find -type f | sed 's/\.\///g'`;
do
echo "$(LOCAL_PATH)/${i}:system/${i} \\";
done
