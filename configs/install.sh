
for d in `ls -d */`; do
  echo "installing ${d}"
  # d contains a trailing slash (/)
  ./${d}install.sh
done
