for i in $(grep -rn "fn main"); do
    i="$(echo $i | cut -d ':' -f1)"
    [ -f "$i" ] || continue

    sed -i '/Jemalloc/d' $i || true
    sed -i '/global_allocator/d' $i || true
    sed -i '/MiMalloc/d' $i || true
    sed -i '/mimalloc/d' $i || true
    sed -i '/jemalloc/d' $i || true
    if [ -n "$(echo $i | grep 'use_mimalloc.sh')" ]; then
        continue
    fi
    
    if [ -z "$(basename $i | grep '.rs')" ]; then
        continue
    fi
    
    if [ -z "$(echo $i | grep "build.rs")" ]; then
        echo  "#[global_allocator]
static GLOBAL: mimalloc::MiMalloc = mimalloc::MiMalloc;" >> $i
    fi
done
