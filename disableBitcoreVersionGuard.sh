#! /bin/bash


disableBitcoreVersionGuard(){
    path=$1
    newPath=$path'_commented'
    echo 'DISABLING CHECK INSIDE '$path
    # echo $newPath
    rm -f $newPath
    while read line; do echo ${line/#bitcore.versionGuard(global._bitcore)/ \/\/bitcore.versionGuard(global._bitcore)} >> $newPath ; done < $path
    rm $path ; mv $newPath $path
}

paths='bitcore-lib/bitcore-lib.js bitcore-lib/index.js bitcore-mnemonic/node_modules/bitcore-lib/bitcore-lib.js bitcore-mnemonic/node_modules/bitcore-lib/index.js eth-lightwallet/node_modules/bitcore-lib/index.js eth-lightwallet/node_modules/bitcore-lib/bitcore-lib.js eth-lightwallet/node_modules/bitcore-lib/index.js'

for path in $paths; do
    disableBitcoreVersionGuard './node_modules/'$path
done
