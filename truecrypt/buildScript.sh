CWD="$(pwd)"
PKCS11_folder=$(pwd)/pkcs11/
WX_folder=$(pwd)/wxWidgets-2.8.11/

cd wxWidgets-2.8.11
./configure
make -j5 -l4
sudo make -j5 -l4 install

echo "$WX_folder"
cd ../truecrypt-7.1a-source
export PKCS11_INC=$PKCS11_folder
echo  "$PKCS11_INC"

make -j5 -l4 NOGUI=1 WX_ROOT=$WX_folder wxbuild 
make -j5 -l4 NOGUI=1 WXSTATIC=1 