for i in $(grep -rn "fn main"); do
    i="$(echo $i | cut -d ':' -f1)"
    
    if [ -n "$(echo $i | grep 'use_mimalloc.sh')" ]; then
        continue
    fi
    if [ -z "$(echo $i | grep "build.rs")" ]; then
        [ -f "$i" ] || continue
        echo  "#[global_allocator]
static GLOBAL: mimalloc::MiMalloc = mimalloc::MiMalloc;" >> $i
    fi
done
