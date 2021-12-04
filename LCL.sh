#User Variables
Directory=~/.minecraft
 
cd ~/.lunarclient/offline/$1
if [ $1 == 1.7 ]
then
    AssetIndex=1.7.10
else
    AssetIndex=$1
fi
 
if [ $2 == "On" ]
then
    Cosmetics=~/.lunarclient/textures
elif [ $2 == "Off" ]
then
    Cosmetics=""
fi
 
echo LC $1	
echo $AssetIndex
echo Cosmetics: $2
 
#Launch Command
~/.lunarclient/jre/zulu*-linux_x64/bin/java --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=natives --add-opens java.base/java.io=ALL-UNNAMED -Djava.library.path=natives -XX:+DisableAttachMechanism -cp vpatcher-prod.jar:lunar-prod-optifine.jar:lunar-libs.jar:lunar-assets-prod-1-optifine.jar:lunar-assets-prod-2-optifine.jar:lunar-assets-prod-3-optifine.jar:OptiFine.jar com.moonsworth.lunar.patcher.LunarMain --version $1 --accessToken 0 --assetIndex $AssetIndex -assetsDir ~/.minecraft/assets --userProperties {} --gameDir "$Directory" --texturesDir "$Cosmetics" --width 854 --height 480 -Xms2G -Xmx2G -Xmn1G
